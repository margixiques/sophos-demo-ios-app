//
//  APIService.swift
//  AppSophos
//
//  Created by Margarita Xiques on 14/12/22.
//

import Foundation

class APIService {
    
    //Singleton instance
    static let shared = APIService()
    
    let baseURL = "https://6w33tkx4f9.execute-api.us-east-1.amazonaws.com/"
}


enum Endpoint {
    case user(email: String, password: String)
}

extension Endpoint {
    var url: URL {
        switch self {
        case .user(let email, let password):
            return .makeForEndpoint("RS_Usuarios?idUsuario=\(email)&clave=\(password)")
        }
    }
}


private extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        let urlString = APIService.shared.baseURL + endpoint
        return URL(string: urlString)!
    }
}
