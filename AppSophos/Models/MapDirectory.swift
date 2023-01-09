//
//  MapDirectory.swift
//  AppSophos
//
//  Created by Margarita Xiques on 5/01/23.
//

//import Foundation
//
//struct MapDirectory {
//  let offices: [Office] = {
//    guard let json = Bundle.main.url(forResource: "offices", withExtension: ".json") else {
//      fatalError("Unable to load json")
//    }
//    do {
//      let jsonData = try Data(contentsOf: json)
//      return try JSONDecoder().decode([Office].self, from: jsonData)
//    } catch {
//      fatalError("Unable to load or parse json file from bundle")
//    }
//  } ()
//}
