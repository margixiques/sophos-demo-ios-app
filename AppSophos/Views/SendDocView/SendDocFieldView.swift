//
//  SendDocFieldView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 22/12/22.
//

import SwiftUI

struct SendDocFieldView: View {
    
    @Binding var text: String
    var title: String = ""
    
    var body: some View {
        
        VStack {
            TextField(title,
                      text: $text)
            .font(.subheadline)
            Divider()
                .frame(height: 1)
                .overlay(.black)
        }
    }
}
