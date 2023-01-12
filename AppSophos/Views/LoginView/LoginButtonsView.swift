//
//  LoginButtonsView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 21/12/22.
//

import SwiftUI

struct LoginButtonsView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            
            Button {
               
                Task {
                    do {
                        let user = try await loginVM.login()
                        authentication.updateValidation(success: user.access)
                    } catch {
                       fatalError()
                    }
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
                    .fill(Color("textColorPurple"))
            )
            .padding(.top, 39)
            
            Button {
                authentication.requestBiometricUnlock { (result: Result<Credentials, Authentication.AuthenticationError>) in
                    switch result {
                    case .success(let credentials):
                        loginVM.credentials = credentials
                        Task {
                            do {
                                let user = try await loginVM.login()
                                authentication.updateValidation(success: user.access)
                            } catch {
                                
                            }
                        }
                    case .failure(let error):
                        loginVM.error = error
                    }
                }
            } label: {
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
            .frame(maxWidth: .infinity, maxHeight: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color("textColorPurple"))
            )
            .padding(.top, 19)
        }
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) { error in
            if error == .credentialsNotSaved {
                return Alert(title: Text("Credentials Not Saved"),
                             message: Text(error.localizedDescription),
                             primaryButton: .default(Text("OK"), action: {
                    loginVM.storeCredentialsNext = true
                }),
                             secondaryButton: .cancel())
            } else {
                return Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
            }
        }
    }
}
