//
//  WatchDocViewModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 7/01/23.
//

import Foundation
import SwiftUI

@MainActor class WatchDocViewModel: ObservableObject {
    
    @Published var items = [ItemEmail]()
    
    func loadData() async throws {
        
        guard let email = KeychainStorage.getCredentials()?.email else { return }
        let url = Endpoint.getDocByUser(email: email).url
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(ResultDocumentEmail.self, from: data) {
                items = decodedResponse.items
            }
            
        } catch {
            print("Invalid data")
        }
    }
    
    func getDate(from itemDate: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z''"
        let date = dateFormatter.date(from: itemDate) ?? Date.now
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: date)
    }
}

