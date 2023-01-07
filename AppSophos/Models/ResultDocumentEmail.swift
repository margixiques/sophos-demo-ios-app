//
//  ResultDocumentEmail.swift
//  AppSophos
//
//  Created by Margarita Xiques on 7/01/23.
//

import Foundation

// MARK: - ResultDocumentEmail
struct ResultDocumentEmail: Codable {
    let items: [ItemEmail]

    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
}

// MARK: - ItemEmail
struct ItemEmail: Codable {
    let idRegister: String
    let date: String
    let attachmentType: String
    let name: String
    let lastname: String

    enum CodingKeys: String, CodingKey {
        case idRegister = "IdRegistro"
        case date = "Fecha"
        case attachmentType = "TipoAdjunto"
        case name = "Nombre"
        case lastname = "Apellido"
    }
}
