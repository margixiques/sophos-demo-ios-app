//
//  SendDocButtonView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI

struct SendDocButtonView: View {
    var body: some View {
        VStack{
            
            Text("Envío de documentación")
                .font(.callout)
                .fontWeight(.heavy)
                .offset(x: -57, y: 0)
            Button {
                
            } label: {
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 60, height: 50)
                    .tint(.black)
            }
        }
        
    }
}

struct SendDocButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocButtonView()
    }
}
