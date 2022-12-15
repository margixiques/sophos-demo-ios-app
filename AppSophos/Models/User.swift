//
//  User.swift
//  AppSophos
//
//  Created by Margarita Xiques on 14/12/22.
//

import Foundation

// MARK: - User
struct User: Codable, Identifiable {
    let id: String
    let name: String
    let lastName: String
    let access: Bool
    let admin: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name = "nombre"
        case lastName = "apellido"
        case access = "acceso"
        case admin
    }
}
