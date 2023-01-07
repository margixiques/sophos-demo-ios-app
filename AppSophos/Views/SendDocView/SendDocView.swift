//
//  SendDocView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct SendDocView: View {
    
    @ObservedObject var vm = SendDocViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack (spacing: 20){
                    
                    Group {
                        SendDocHeaderView()
                        Spacer()
                        SendDocPickerPhotoView(selectedPhotoData: $vm.personalInfo.imageData)
                        Spacer()
                        SendDocIdTypeView(docType: $vm.personalInfo.idType)
                    }
                    
                    Group {
                        SendDocIdView(identification: $vm.personalInfo.identification)
                        
                        SendDocFieldView(text: $vm.personalInfo.name,
                                         title: "Nombre")
                        SendDocFieldView(text: $vm.personalInfo.lastname,
                                         title: "Apellidos")
                        SendDocFieldView(text: $vm.personalInfo.email,
                                         title: "Email")
                        SendDocCityFieldView(city: $vm.personalInfo.city)
                        SendDocFieldView(text: $vm.personalInfo.attachType,
                                         title: "Tipo de adjunto")
                    }
                    Spacer()
                    Button {
                        Task{
                            await vm.actionButton()
                        }
                       
                    } label: {
                        Text("Enviar")
                    }
                    .fontWeight(.heavy)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("colorPink"))
                    ).padding(.top, 30)
                    
                
                    
                }.padding(.horizontal, 20)
            }
        }.navigationBarBackButtonHidden(true)
    }
}



struct SendDocView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocView()
    }
}






