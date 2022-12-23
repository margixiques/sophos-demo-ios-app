//
//  LoginEmailView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 21/12/22.
//

import SwiftUI

struct LoginEmailView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(Color("textColorPurple"))
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .overlay(
                    Divider()
                        .frame(width: 1.0)
                        .background(Color("textColorPurple")),
                    alignment: .trailing
                )
            TextField("Email", text: $loginVM.credentials.email)
                .keyboardType(.emailAddress)
                .foregroundColor(Color("textColorPurple"))
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("textColorPurple"), lineWidth: 1)
        )
        .padding(.vertical, 20)
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView()
        
    }
}
