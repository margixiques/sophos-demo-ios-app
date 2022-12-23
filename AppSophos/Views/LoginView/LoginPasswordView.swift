//
//  LoginPasswordView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 21/12/22.
//

import SwiftUI

struct LoginPasswordView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    @State private var showPassword: Bool = false
    @FocusState private var inFocus: Field?
    @State private var maskedIconName = "eye.fill"
    
    enum Field {
        case plain
        case secure
    }
    
    var body: some View {
        HStack {
            Image("keyIcon")
                .overlay(
                    Divider()
                        .frame(width: 1.0)
                        .background(Color("textColorPurple")),
                    alignment: .trailing
                )
            
            if showPassword {
                TextField("Password", text: $loginVM.credentials.password)
                    .focused($inFocus, equals: .plain)
                    .foregroundColor(Color("textColorPurple"))
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            } else {
                SecureField("Password", text: $loginVM.credentials.password)
                    .foregroundColor(Color("textColorPurple"))
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .focused($inFocus, equals: .secure)
            }
            
            Button {
                self.showPassword.toggle()
                inFocus = showPassword ? .plain : .secure
                maskedIconName = showPassword ? "eye.slash.fill" : "eye.fill"
                
            } label: {
                Image(systemName: maskedIconName)
                    .tint(Color("textColorPurple"))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("textColorPurple"), lineWidth: 1)
        )
    }
}


struct LoginPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPasswordView()
        
    }
}
