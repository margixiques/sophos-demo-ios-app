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
struct Office: Codable {
    let city: String
    let longitude: String
    let idOffice: Int
    let latitude: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case city = "Ciudad"
        case longitude = "Longitud"
        case idOffice = "IdOficina"
        case latitude = "Latitud"
        case name = "Nombre"
    }
}

//// MARK: - Office
//final class Office1: Decodable, Identifiable {
//    let city: String
//    let longitude: Double
//    let idOffice: Int
//    let latitude: Double
//    let name: String
//    let location: CLLocation
//    private let regionRadius: CLLocationDistance = 1000
//    let region: MKCoordinateRegion
//    let id = UUID()
//    
//    required init(from decoder: Decoder) throws {
//        
//        enum CodingKeys: String, CodingKey {
//            case idOffice = "IdOficina"
//            case name = "Nombre"
//            case city = "Ciudad"
//            case longitude = "Longitud"
//            case latitude = "Latitud"
//        }
//        
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        idOffice = try values.decode(Int.self, forKey: .idOffice)
//        name = try values.decode(String.self, forKey: .name)
//        city = try values.decode(String.self, forKey: .city)
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//        location = CLLocation(latitude: latitude, longitude: longitude)
//        region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
//        
//    }
//}
//
