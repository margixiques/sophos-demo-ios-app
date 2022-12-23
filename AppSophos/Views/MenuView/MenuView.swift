//
//  MenuView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 14/12/22.
//

import SwiftUI

struct MenuView: View {
   
   @State var userName: String = ""
   
   var body: some View {
      
      NavigationView{
         ScrollView {
            VStack {
               HStack{
                  Text(userName)
                  Spacer()
                  MenuButtonView()
               }  .font(.title3)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("textColorPurple"))
                  .padding()
                  .padding(.top, 25)
               MenuBackgroundView()
                  .padding(.bottom, 40)
               VStack (spacing: 45){
                  ForEach(MenuType.allCases, id: \.rawValue) {
                     BoxView(menuType: $0)
                  }
               }.padding(.bottom, 40)
            }.onAppear {
               userName = UserDefaults.standard.string(forKey: "userName") ?? "Algo"
            }
         }
      }
   }
}

struct MenuView_Previews: PreviewProvider {
   static var previews: some View {
      MenuView()
   }
}

