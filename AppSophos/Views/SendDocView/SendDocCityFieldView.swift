//
//  SendDocCityFieldView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI

struct SendDocCityFieldView: View {
    
   @Binding var city: String

    var body: some View {
        HStack {
            
            if city.isEmpty {
                Text("Ciudad")
            } else {
                Text(city)
            }
            Spacer()
            Menu {
                
                ForEach(City.allCases, id: \.rawValue) { type in
                    Button {
                        city = type.rawValue
                    } label: {
                        Text(type.rawValue)
                    }
                }

            } label: {
                Image(systemName: "arrowtriangle.down.fill")
                    .tint(.black)
            }
        }.font(.subheadline)
        Divider()
            .frame(height: 1)
            .overlay(.black)
    }
}
