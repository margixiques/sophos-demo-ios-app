//
//  LoginViewModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 14/12/22.
//

import Foundation

@MainActor class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    @Published var storeCredentialsNext = false
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login() async throws -> User {
        showProgressView = true
        let url = Endpoint.user(email: credentials.email, password: credentials.password).url
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
//        guard (response as? HTTPURLResponse)?.statusCode == 200
//        else { fatalError("Error while fetching data") }
        
        let user = try JSONDecoder().decode(User.self, from: data)
        if user.access == false {
            error = .invalidCredentials
        }
        if storeCredentialsNext {
            if KeychainStorage.saveCredentials(credentials) {
                storeCredentialsNext = false
            }
            
        }
        showProgressView = false
        return user
    }
    
//    func login(completion: @escaping (Bool) -> Void) {
//        showProgressView = true
//        APIService.shared.login(credentials: credentials) { [unowned self](result:Result<Bool, Authentication.AuthenticationError>) in
//            showProgressView = false
//            switch result {
//            case .success:
//                completion(true)
//            case .failure(let authError):
//                credentials = Credentials()
//                error = authError
//                completion(false)
//            }
//        }
//
//    }
}


