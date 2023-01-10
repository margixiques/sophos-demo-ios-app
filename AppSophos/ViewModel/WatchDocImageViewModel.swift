//
//  WatchDocImageViewModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 9/01/23.
//

import Foundation
import SwiftUI

 
class WatchDocImageViewModel: ObservableObject {
    
    var idRegister: String
    
    @Published var image: UIImage?
    
    init(idRegister: String) {
        self.idRegister = idRegister
    }
    
    func fetchDocument() async throws {
        let url = Endpoint.getDocByIdRegister(idRegister: idRegister).url
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let documentList = try JSONDecoder().decode(DocumentList.self, from: data)
            getImage(from: documentList.items[0].attachment)
            
        } catch {
            print("Invalid data")
        }
    
    }
    
    private func getImage(from base64String: String) {
        guard let imageData = Data(base64Encoded: base64String) else { return }
        image = UIImage(data: imageData)
    }
}
