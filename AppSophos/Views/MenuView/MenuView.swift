//
//  MenuView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 14/12/22.
//

import SwiftUI

struct MenuView: View {
   
   @State var user: User
   
   var body: some View {
      VStack {
         TopView(name: user.name ?? "")
            .padding(.top, 40)
         BackgroundView()
         Spacer()
         VStack (spacing: 42){
            ForEach(MenuType.allCases, id: \.rawValue) { BoxView(menuType: $0)}
         } .offset(x:0, y: -90)
      }
   }
}


struct MenuView_Previews: PreviewProvider {
   static var previews: some View {
      MenuView(user: User(
         id: nil,
         name: "Margi",
         lastName: nil,
         access: true,
         admin: nil)
      )
   }
}

