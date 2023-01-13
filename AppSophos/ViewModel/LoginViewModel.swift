//
//  LoginViewModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 14/12/22.
//

import Foundation
import SwiftUI

@MainActor class LoginViewModel: ObservableObject {
    
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    @Published var storeCredentialsNext = false
    @EnvironmentObject var authentication: Authentication
    
    var loginDisabled: Bool {
        
        credentials.email.isEmpty || credentials.password.isEmpty
    }

    private func saveName(_ name: String) {
        
        UserDefaults.standard.set(name, forKey: "userName")
    }
    
    func performLogin() {
        
        Task {
            do {
                let user = try await login()
                authentication.updateValidation(success: user.access)
            } catch {
                fatalError()
            }
        }
    }
    
     func login() async throws -> User {
         
        showProgressView = true
        let url = Endpoint.user(email: credentials.email, password: credentials.password).url
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else { fatalError("Error while login") }
        
        let user = try JSONDecoder().decode(User.self, from: data)
        if user.access == false {
            error = .invalidCredentials
        }
        if storeCredentialsNext {
            if KeychainStorage.saveCredentials(credentials) {
                storeCredentialsNext = false
            }
            
        }
        saveName(user.name ?? "")
        showProgressView = false
        return user
    }
      
}


