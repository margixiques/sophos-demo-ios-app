//
//  TextFieldView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct TextFieldView: View {
    
    let fieldType: FieldType
    
    var body: some View {
        
//        HStack {
//            TextField(fieldType.title, text: <#Binding<String>#>)
//                .font(.subheadline)
//            .fontWeight(.semibold)
//        }
//        Divider()
         //   .overlay(.black)
        Text("hola")
    }
}

enum FieldType: Int, CaseIterable {
   case name = 0
   case lastname
   case email
}

extension FieldType {
    
    var title: String {
        switch self {
        case .name:
            return "Nombres"
        case .lastname:
            return "Apellidos"
        case .email:
            return "Email"
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(FieldType.allCases, id: \.rawValue) { TextFieldView(fieldType: $0)}
    }
}
