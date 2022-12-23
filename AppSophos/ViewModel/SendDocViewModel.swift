//
//  SendDocViewModel.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import Combine

struct PersonalInfo {
    var names: String = ""
    var lastname: String = ""
    var identification: String = ""
    var email: String = ""
    var attachType: String = ""
}

class DocFormViewModel: ObservableObject {
    @Published var personalInfo = PersonalInfo()
}

