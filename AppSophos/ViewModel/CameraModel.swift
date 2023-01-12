//
//  CameraModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 11/01/23.
//

import Foundation
import AVFoundation
import SwiftUI

class CameraModel : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var isSaved = false
    @Published var picData = Data(count:0)
    
    func check(){
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case .notDetermined :
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status{
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
            
        default:
            return
        }
    }
    
    func setUp(){
        do{
            self.session.beginConfiguration()
         
            guard let device: AVCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                for: .video, position: .back) else {
                return
            }
            let input = try AVCaptureDeviceInput(device: device)
            if self.session.canAddInput(input){
                print("input taken")
                self.session.addInput(input)
            }else{
                print("input not  taken")
            }
            if self.session.canAddOutput(output){
                print("output taken")
                self.session.addOutput(output)
            }
            self.session.commitConfiguration()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func takePic(){
         self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
         DispatchQueue.global(qos: .background).async {
             self.session.stopRunning()
             DispatchQueue.main.async {
                 withAnimation{
                     self.isTaken.toggle()
 
                 }
             }
         }
     }
 
     func reTake(){
 
         DispatchQueue.global(qos: .background).async {
             self.session.startRunning()
             DispatchQueue.main.async {
                 withAnimation{
                     self.isTaken.toggle()
 
                 }
                     self.isSaved=false
                     self.picData=Data(count: 0)
 
             }
         }
     }
 
     func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
         if error != nil{
             return
         }
         print("picture taken")
         guard let imageData = photo.fileDataRepresentation() else {
             return
         }
         self.picData = imageData
     }
 
     func savePic(){
         guard let image = UIImage(data: self.picData) else{return}
         //saving image
         UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
         self.isSaved=true
         print("pic saved")
     }
 
}

struct CameraPreview : UIViewRepresentable{
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context:Context) -> UIView {
        
        let view = UIView(frame:UIScreen.main.bounds)
        camera .preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        self.camera.session.startRunning()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
