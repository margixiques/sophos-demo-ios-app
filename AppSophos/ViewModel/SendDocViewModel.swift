//
//  SendDocViewModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//


import Foundation
import UIKit

enum DocType: String, CaseIterable {
    case cc = "Cédula de Ciudadanía"
    case ti = "Tarjeta de Identidad"
    case pa = "Pasaporte"
    case ce = "Cédula de Extranjería"
}

enum City: String, CaseIterable {
    case ch = "Chile"
    case usa = "Estados Unidos"
    case pa = "Panamá"
    case mex = "México"
    case med = "Medellín"
    case bog = "Bogotá"
}

struct PersonalInfo {
    var name: String = ""
    var lastname: String = ""
    var idType: String = ""
    var identification: String = ""
    var email: String = ""
    var city: String = ""
    var attachType: String = ""
    var attach: String = ""
    var imageData: Data?
    var uiImage: UIImage?
    
}

@MainActor class SendDocViewModel: ObservableObject {
    
    @Published var personalInfo = PersonalInfo()
    @Published var showProgressView = false
    @Published var showAlert = false
    
    private func setImage() async {
        
        personalInfo.uiImage = UIImage(data: personalInfo.imageData ?? Data())
        personalInfo.imageData = personalInfo.uiImage?.jpegData(compressionQuality: 0.0) ?? Data()
    }
    
    private func postDocument() async {
        // Encode image to base64
        personalInfo.attach = personalInfo.imageData?.base64EncodedString() ?? ""
        
        let document = PostDocument(
            idType: personalInfo.idType,
            identification: personalInfo.identification,
            name: personalInfo.name,
            lastName: personalInfo.lastname,
            city: personalInfo.city,
            email: personalInfo.email,
            attachmentType: personalInfo.attachType,
            attachment: personalInfo.attach
        )
        
        guard let encoded = try? JSONEncoder().encode(document) else {
            print("Failed to encode personalInfo")
            return
        }
        
        // send request to server
        let url = Endpoint.sendDoc.url
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        // send the request
        Task{
            
            do {
                let (data, response) = try await URLSession.shared.upload(for: urlRequest, from: encoded)
                
                if let decodedResponse = try? JSONDecoder().decode(Put.self, from: data) {
                    if decodedResponse.put == true {
                        showAlert = true
                    }
                }
                
                guard (response as? HTTPURLResponse)?.statusCode == 200
                else { fatalError("Error while post Document") }
                
            } catch {
                print("Checkout failed.")
            }
            showProgressView = false
        }
    }
    
    func actionButton() async {
        
        showProgressView = true
        await setImage()
        await postDocument()
       
    }
}




