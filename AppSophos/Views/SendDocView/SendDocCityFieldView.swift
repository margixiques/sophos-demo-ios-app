//
//  SendDocCityFieldView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI

struct SendDocCityFieldView: View {
    var body: some View {
        HStack {
            
            Text("Ciudad")
            Spacer()
            Menu {
                
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
