//
//  AppSophosApp.swift
//  AppSophos
//
//  Created by Margarita Xiques on 13/12/22.
//

import SwiftUI

@main
struct AppSophosApp: App {
   
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                MenuView(user: User(id: nil, name: "Margi", lastName: nil, access: true, admin: nil))
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
            
        }
    }
}
