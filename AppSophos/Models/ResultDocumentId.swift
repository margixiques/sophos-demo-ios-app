//
//  ResultDocumentId.swift
//  AppSophos
//
//  Created by Margarita Xiques on 7/01/23.
//

import Foundation

// MARK: - ResultDocumentId
struct ResultDocumentId: Codable {
    let items: [ItemId]
    
    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
}

// MARK: - ItemId
struct ItemId: Codable {
    let idRegister: String = ""
    let date: String = ""
    let idType: String = ""
    let identification: String = ""
    let name: String = ""
    let lastname: String = ""
    let city: String = ""
    let email: String = ""
    let attachmentType: String = ""
    let attachment: String = ""

    enum CodingKeys: String, CodingKey, CaseIterable {
        case idRegister = "IdRegistro"
        case date = "Fecha"
        case idType = "TipoId"
        case identification = "Identificacion"
        case name = "Nombre"
        case lastname = "Apellido"
        case city = "Ciudad"
        case email = "Correo"
        case attachmentType = "TipoAdjunto"
        case attachment = "Adjunto"
    }
}
