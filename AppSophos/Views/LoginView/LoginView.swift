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
    @State private var showPassword: Bool = false
    @FocusState private var inFocus: Field?
    @State private var maskedIconName = "eye.fill"
    
    enum Field {
        case plain
        case secure
    }
    
    var body: some View {
        ZStack {
            Color("mainBackgroundColor")
            VStack {
                
                // MARK: - Header
                LoginHeaderView()
                
                // MARK: - Email
                LoginEmailView(email: $loginVM.credentials.email)
                
                // MARK: - Password
                LoginPasswordView(password: $loginVM.credentials.password)
                
                if loginVM.showProgressView {
                    ProgressView()
                }
                
                // MARK: - Buttons
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
                .disabled(loginVM.loginDisabled)
                
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
                    BiometricButtonStyle()
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
        }.padding(.horizontal, 15)
        .environmentObject(authentication)
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(Authentication())
    }
}







