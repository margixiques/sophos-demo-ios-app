//
//  IdMenuViewModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import Foundation

class SendDocIdTypeViewModel: ObservableObject {
    @Published var docType: String = "Tipo de documento"
    
    func cc() { docType = "Cédula de Ciudadanía" }
    func ti() { docType = "Tarjeta de Identidad" }
    func pa() { docType = "Pasaporte" }
    func ce() { docType = "Cédula de Extranjería"}
}
