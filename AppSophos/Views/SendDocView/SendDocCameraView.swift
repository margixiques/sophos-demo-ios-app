//
//  CameraView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 11/01/23.
//

import SwiftUI

struct SendDocCameraView: View {
    @StateObject var camera = CameraModel()
    
    var body: some View {
        ZStack{
            
            CameraPreview(camera: camera)
                .ignoresSafeArea()
            VStack{
                
                if camera.isTaken{
                    HStack{
                        Spacer()
                        Button(action: camera.reTake, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                            
                        }).padding(.trailing,10)
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    if camera.isTaken{
                        Button(action: {
                            if !camera.isSaved{
                                camera.savePic()
                            }
                        }, label: {
                            Text(camera.isSaved ? "Saved" : "Save")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }).padding(.leading)
                        Spacer()
                        
                    } else {
                        Button(action: camera.takePic, label: {
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 65, height: 65, alignment: .center)
                                Circle()
                                    .stroke(Color.white,lineWidth: 2)
                                    .frame(width: 75, height: 75, alignment: .center)
                            }
                        })
                    }
                }.frame(height: 75)
            }
        }.onAppear(perform: {
            camera.check()
        }).alert(isPresented: $camera.alert){
            Alert(title: Text("Enable camera"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocCameraView()
    }
}

