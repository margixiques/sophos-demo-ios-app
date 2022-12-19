//
//  TopView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct TopView: View {
   
   var name: String
   
   var body: some View {
      
      HStack {
         Text(name)
         Spacer()
         Menu {
            Button("Enviar documentos", action: sendDocuments)
            Button("Ver documentos", action: watchDocuments)
            Button("Oficinas", action: offices)
            Button("Modo nocturno", action: darkMode)
            Button("Idioma Inglés", action: englishLanguage)
         } label: {
            Image(systemName: "list.dash")
         }
         .foregroundColor(Color("textColorPurple"))
      }
      .font(.title3)
      .fontWeight(.heavy)
      .foregroundColor(Color("textColorPurple"))
      .padding()
   }
   func sendDocuments() { }
   func watchDocuments() { }
   func offices() { }
   func darkMode() { }
   func englishLanguage() { }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(name: "Margi")
    }
}
