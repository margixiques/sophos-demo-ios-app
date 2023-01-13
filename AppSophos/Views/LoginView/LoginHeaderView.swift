//
//  LoginHeaderView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct LoginHeaderView: View {
    
    var body: some View {
        
        VStack {
            
            Image("sophosLogin")
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            Text("Ingresa tus datos para acceder")
                .fontWeight(.bold)
                .font(.footnote)
                .foregroundColor(Color("textColorPurple"))
                .multilineTextAlignment(.center)
        }
    }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView()
    }
}
