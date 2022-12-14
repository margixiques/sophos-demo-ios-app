//
//  LoginView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 13/12/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            Image("sophosLogin")
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            Text("Ingresa tus datos para acceder")
                .fontWeight(.bold)
                .font(.footnote)
                .foregroundColor(Color("loginColor"))
                .multilineTextAlignment(.center)
            
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(Color("loginColor"))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .overlay(
                        Divider()
                            .frame(width: 1.0)
                            .background(Color("loginColor")),
                        alignment: .trailing
                    )
                TextField("Email", text: $loginVM.credentials.email)
                    .keyboardType(.emailAddress)
                    .foregroundColor(Color("loginColor"))
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("loginColor"), lineWidth: 1)
            )
            .padding(.vertical, 20)
            
            HStack {
                Image("keyIcon")
                    .overlay(
                        Divider()
                            .frame(width: 1.0)
                            .background(Color("loginColor")),
                        alignment: .trailing
                    )
                SecureField("Password", text: $loginVM.credentials.password)
                    .foregroundColor(Color("loginColor"))
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                Button {
                    
                    
                } label: {
                    Image("Mask")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("loginColor"), lineWidth: 1)
            )
            if loginVM.showProgressView {
                ProgressView()
            }
            
            Button {
                loginVM.login { sucess in
                    authentication.updateValidation(sucess: sucess)
                }
                
            } label: {
                Text("Ingresar")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.footnote)
                    .padding(.horizontal, 15)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("loginColor"))
                
            )
            .padding(.top, 39)
            .disabled(loginVM.loginDisabled)
            
            if authentication.biometricType() != .none {
                Button {
                    
                    
                } label: {
                    HStack {
                        Image(systemName: authentication.biometricType() == .face ? "faceid" : "touchid")
                            .tint(Color("loginColor"))
                            .padding(.trailing, 23)
                        Text(authentication.biometricType() == .face ? "Ingresar con Face ID" : "Ingresar con huella")
                            .foregroundColor(Color("loginColor"))
                            .fontWeight(.bold)
                            .font(.footnote)
                            .padding(.trailing, 15)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color("loginColor"))
                        
                        
                )
                .padding(.top, 19)
                
            }
        }
        .padding(.horizontal, 15)
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) { error in
            Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(Authentication())
    }
}

