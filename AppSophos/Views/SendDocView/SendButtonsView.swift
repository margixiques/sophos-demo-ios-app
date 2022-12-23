//
//  SendButtonsView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 21/12/22.
//

import SwiftUI

struct SendButtonsView: View {
    
    var body: some View {
        
        VStack (spacing: 25){
            Button {
                
            } label: {
                HStack{
                    Image(systemName: "icloud.and.arrow.up")
                    Text("Documento")
                }
            }
            
            .fontWeight(.heavy)
            .font(.subheadline)
            .foregroundColor(.white)
            .frame(width: 160, height: 40)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("colorPink"))
            ) .offset(x: -78, y: 0)
            
            Button {
                
            } label: {
                Text("Enviar")
            }
            .fontWeight(.heavy)
            .font(.subheadline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("colorPink"))
            )
        }
    }
}

struct SendButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SendButtonsView()
    }
}
