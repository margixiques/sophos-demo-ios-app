//
//  BiometricButtonLabel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI

struct BiometricButtonStyle: View {
    
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        
        HStack {
            
            Image(systemName: authentication.biometricType() == .face ? "faceid" : "touchid")
                .tint(Color("textColorPurple"))
                .padding(.trailing, 23)
            Text(authentication.biometricType() == .face ? "Ingresar con Face ID" : "Ingresar con huella")
                .foregroundColor(Color("textColorPurple"))
                .fontWeight(.bold)
                .font(.footnote)
                .padding(.trailing, 15)
        }
    }
}


