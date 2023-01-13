//
//  SendDocIdView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI

struct SendDocIdView: View {
    
    @Binding var identification: String
    
    var body: some View {
        
        HStack{
            Image(systemName: "person.text.rectangle")
                .resizable()
                .frame(width: 24, height: 20)
            TextField("Numero de documento", text: $identification)
                .padding(.leading)
        }
        .font(.subheadline)
        Divider()
            .frame(height: 1)
            .overlay(.black)
    }
}
