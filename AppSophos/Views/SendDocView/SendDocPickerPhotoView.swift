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
    
    var body: some View {
        NavigationStack {
            VStack{
                
                Text("Envío de documentación")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .offset(x: -57, y: 0)
                    .padding(.bottom, 30)
                
                
                        PhotosPicker(selection: $selectedItem,
                                     matching: .images)
                         {
                             if let selectedPhotoData,
                                let image = UIImage(data: selectedPhotoData) {
                                 
                                 Image(uiImage: image)
                                     .resizable()
                                     .scaledToFit()
                                     .clipped()
                                     .frame(height: 300)
                             } else {
                                 Image(systemName: "camera")
                                      .resizable()
                                      .tint(.black)
                                      .frame(width: 60, height: 50)
                             }
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedPhotoData = data
                                }
                            }
                        }
                    
                    Button {
                        
                    } label: {
                        Text("Tomar Foto")
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
