//
//  TextFieldView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var personalInfo: String
    
    let fieldType: FieldType
    
    var body: some View {
        
        VStack {
            
            TextField(fieldType.title,text: $personalInfo)
                .font(.subheadline)
        }
        Divider()
            .frame(height: 1)
            .overlay(.black)
            
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
        VStack{
            
            ForEach(FieldType.allCases, id: \.rawValue) { TextFieldView(personalInfo: "", fieldType: $0)}
        }
        
        
    }
}
