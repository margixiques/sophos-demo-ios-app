//
//  OfficesViewModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 7/01/23.
//

//import Foundation
//import CoreLocation
//
//class OfficesViewModel: ObservableObject {
//  
//   // @Published var offices: [Office] = []
//    
//    func readFile() {
//        if let url = Bundle.main.url(forResource: "Offices", withExtension: "json"),
//           let data = try? Data(contentsOf: url) {
//            let decoder = JSONDecoder()
//            if let officesList = try? decoder.decode(OfficeList.self, from: data) {
//                self.offices = officesList.offices
//            }
//        }
//    }
    
//    func getOffices() async throws {
//
//        let url = Endpoint.findOffices.url
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decodedResponse = try? JSONDecoder().decode(OfficeList.self, from: data) {
//                offices = decodedResponse.offices
//            }
//        } catch {
//            print("Invalid data")
//        }
//
//    }
//}
