//
//  Office.swift
//  AppSophos
//
//  Created by Margarita Xiques on 5/01/23.
//

import Foundation
import MapKit

// MARK: - OficeList
struct OfficeList: Codable {
    let offices: [Office]

    enum CodingKeys: String, CodingKey {
        case offices = "Items"
    }
}

// MARK: - Item
struct Office: Codable, Identifiable {
    let id = UUID()
    let city: String
    var longitude: Double
    let idOffice: Int
    var latitude: Double
    var name: String
   

    enum CodingKeys: String, CodingKey {
        case city = "Ciudad"
        case longitude = "Longitud"
        case idOffice = "IdOficina"
        case latitude = "Latitud"
        case name = "Nombre"
    }
}

