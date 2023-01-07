//
//  Document.swift
//  AppSophos
//
//  Created by Margarita Xiques on 5/01/23.
//

import Foundation

// MARK: - Document
struct Document: Codable {
    let idType: String
    let identification: String
    let name: String
    let lastName: String
    let city: String
    let email: String
    let attachmentType: String
    let attachment: String

    enum CodingKeys: String, CodingKey {
        case idType = "TipoId"
        case identification = "Identificacion"
        case name = "Nombre"
        case lastName = "Apellido"
        case city = "Ciudad"
        case email = "Correo"
        case attachmentType = "TipoAdjunto"
        case attachment = "Adjunto"
    }
}
