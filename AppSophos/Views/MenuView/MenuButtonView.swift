//
//  TopView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct MenuButtonView: View {
    
    
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false
    
    var body: some View {
        
            Menu {
                Button {
                    self.navigateTo = AnyView(SendDocView())
                    self.isNavigationActive = true
                } label: {
                    Text("Enviar documentos")
                }
                Button {
                    self.navigateTo = AnyView(WatchDocView())
                    self.isNavigationActive = true
                } label: {
                    Text("Ver documentos")
                }
                Button {
                    self.navigateTo = AnyView(OfficesView())
                    self.isNavigationActive = true
                } label: {
                    Text("Oficinas")
                }
                Button("Modo nocturno", action: darkMode)
                Button("Idioma Inglés", action: englishLanguage)
                Button {
                self.navigateTo = AnyView(LoginView())
                self.isNavigationActive = true
            } label: {
                Text("Cerrar sesión")
            }
                //("Cerrar sesión", action: logout)
            } label: {
                Image(systemName: "list.dash")
                    
            }
            .overlay(
                NavigationLink(destination: AnyView(self.navigateTo), isActive: $isNavigationActive) {
                    EmptyView()
                })
    }
    
    func darkMode() { }
    func englishLanguage() { }
    func logout() { }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView()
    }
}
