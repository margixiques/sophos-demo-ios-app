//
//  SendDocHeaderView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI

struct SendDocHeaderView: View {
    
    var body: some View {
        
        VStack (spacing: 20){
            HStack{
                HStack{
                    Image(systemName: "arrow.left")
                    Text("Regresar")
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
