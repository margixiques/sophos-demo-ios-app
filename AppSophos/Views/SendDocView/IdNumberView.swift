//
//  IdNumberView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct IdNumberView: View {
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
            .overlay(.black)
    }
}

//struct IdNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        IdNumberView(identification: "")
//    }
//}
