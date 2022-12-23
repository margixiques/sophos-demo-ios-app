//
//  SendDocHeaderView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI

struct SendDocHeaderView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack (spacing: 20){
            HStack{
                HStack{
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                        Text("Regresar")
                    }   
                }
                
                Spacer()
                MenuButtonView()
            }  .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(Color("textColorPurple"))
                .padding()
            
           
        }
    }
}

struct SendDocHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocHeaderView()
    }
}
