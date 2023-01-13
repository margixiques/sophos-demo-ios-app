//
//  SendDocButtonView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI
import PhotosUI

struct SendDocPickerPhotoView: View {
    
    @State private var selectedItem: PhotosPickerItem?
    @Binding var selectedPhotoData: Data?
    @State var showingPhotosPicker = false
    @State var showingCameraView = false
    
    var body: some View {
        NavigationStack {
            VStack{
                
                Text("Envío de documentación")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .offset(x: -57, y: 0)
                    .padding(.bottom, 30)
                
                Menu {
                    
                    Button {
                        
                        showingCameraView.toggle()
                        
                    } label: {
                        Text("Tomar foto")
                    }
                    
                    Button {
                        
                        showingPhotosPicker.toggle()
                        
                    } label: {
                        Text("Cargar foto")
                    }
                    
                } label: {
                    if let selectedPhotoData,
                       let image = UIImage(data: selectedPhotoData) {
                        
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .frame(height: 370)
                    } else {
                        Image(systemName: "camera")
                            .resizable()
                            .tint(.black)
                            .frame(width: 60, height: 50)
                            .overlay (alignment: .topTrailing){
                                Image(systemName: "plus")
                                    .frame(width: 2, height: 4)
                                    .tint(.black)
                                    .fontWeight(.heavy)
                            }
                    }
                }
                .photosPicker(isPresented: $showingPhotosPicker, selection: $selectedItem, matching: .images)
                
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedPhotoData = data
                        }
                    }
                }
                .sheet(isPresented: $showingCameraView) {
                    SendDocCameraView()
                }
            }
        }
    }
}

struct SendDocButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocPickerPhotoView(selectedPhotoData:.constant(nil))
        
    }
}
