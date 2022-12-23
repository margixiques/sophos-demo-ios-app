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
    case sendDoc
    case findDoc(id: String, email: String)
    case findOffices(city: String)
}


extension Endpoint {
    var url: URL {
        switch self {
        case .user(let email, let password):
            return .makeForEndpoint("RS_Usuarios?idUsuario=\(email)&clave=\(password)")
        case .sendDoc:
            return .makeForEndpoint("RS_Documentos")
        case .findDoc(id: let id, email: let email):
            return .makeForEndpoint("RS_Documentos?idRegistro=\(id)&correo=\(email)")
        case .findOffices(city: let city):
            return .makeForEndpoint("RS_Oficinas?ciudad=\(city)")
        }
    }
}


private extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        let urlString = APIService.shared.baseURL + endpoint
        return URL(string: urlString)!
    }
}
