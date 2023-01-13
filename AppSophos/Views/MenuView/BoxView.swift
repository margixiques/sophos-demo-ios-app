//
//  BoxView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct BoxView: View {
   
   let menuType: MenuType
    
   var body: some View {
   
      VStack (spacing: 15) {
         
         HStack {
            Image(systemName: menuType.iconName)
            Text(menuType.title)
               .font(.footnote)
         }
         .frame(width: 151,
                height: 30,
                alignment: .leading
         )
         .offset(x: -80, y: 0)
          
          NavigationLink {
              menuType.destination
          } label: {
              HStack {
                 Text("Ingresar")
                    .font(.caption2)
                 Image(systemName: "arrow.forward")
              }
              .overlay(
              RoundedRectangle(cornerRadius: 10)
                 .strokeBorder()
                 .frame(width: 100, height: 28)
              )
           } .offset(x: 110, y: 0)
          
      }.overlay(
         RoundedRectangle(cornerRadius: 10)
            .strokeBorder()
            .frame(width: 350, height: 90)
      )
      .foregroundColor(Color(menuType.color))
      .fontWeight(.bold)
   }
}

enum MenuType: Int, CaseIterable {
   case sendDocument = 0
   case watchDocument
   case offices
}

extension MenuType {
   var iconName: String {
      switch self {
      case .sendDocument:
         return "doc.text"
      case .watchDocument:
         return "doc.text.magnifyingglass"
      case .offices:
         return "mappin.and.ellipse"
      }
   }
   
   var title: String {
      switch self {
      case .sendDocument:
         return "Enviar documentos"
      case .watchDocument:
         return "Ver documentos"
      case .offices:
         return "Oficinas"
      }
   }
   
   var color: String {
      switch self {
      case .sendDocument:
         return "colorPink"
      case .watchDocument:
         return  "colorBlue"
      case .offices:
         return "colorGreen"
      }
   }
    
    var destination: some View {
        switch self {
        case .sendDocument:
            return AnyView(SendDocView())
        case .watchDocument:
            return AnyView(WatchDocView())
        case .offices:
            return AnyView(OfficesView())
        }
    }
   
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack (spacing: 42){
           
           ForEach(MenuType.allCases, id: \.rawValue) { BoxView(menuType: $0)}
        }
    }
}
