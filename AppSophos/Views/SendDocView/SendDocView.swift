//
//  SendDocView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct SendDocView: View {
    
    @ObservedObject var vm = DocFormViewModel()
    
    
    var body: some View {
        
        NavigationStack {
            VStack (spacing: 20){
                Group {
                    SendDocHeaderView()
                    Spacer()
                    SendDocButtonView()
                    Spacer()
                    SendDocIdTypeView()
                }
                
                Group {
                    SendDocIdView(identification: $vm.personalInfo.identification)
                    
                    SendDocFieldView(text: $vm.personalInfo.names,
                                     title: "Nombre")
                    SendDocFieldView(text: $vm.personalInfo.lastname,
                                     title: "Apellidos")
                    SendDocFieldView(text: $vm.personalInfo.email,
                                     title: "Email")
                    SendDocCityFieldView()
                    SendDocFieldView(text: $vm.personalInfo.attachType,
                                     title: "Tipo de adjunto")
                }
                
                SendButtonsView().padding(.top, 30)
                
                Spacer()
                
            }.padding(.horizontal, 20)
        }.navigationBarBackButtonHidden(true)
    }
}



struct SendDocView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocView()
    }
}






