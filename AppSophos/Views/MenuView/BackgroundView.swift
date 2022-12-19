//
//  BackgroundView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct BackgroundView: View {
   var body: some View {
      
      ZStack {
         Image("PlantillaCorporativa")
            .resizable()
            .frame(width: .infinity, height: 260)
         
         VStack (spacing: 70) {
            Text("Bienvenid@")
               .foregroundColor(.white)
               .fontWeight(.heavy)
               .font(.headline)
               .offset(x: -110, y: 0)
            
            Text("Estas son las opciones que tenemos para ti")
               .foregroundColor(.white)
               .fontWeight(.heavy)
               .font(.footnote)
               .frame(width: 150, height: 60)
               .multilineTextAlignment(.center)
               .offset(x: -90, y: 0)
         }
      }
   }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
