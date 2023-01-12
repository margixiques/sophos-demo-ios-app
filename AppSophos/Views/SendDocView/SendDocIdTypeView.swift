//
//  IdMenuView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct SendDocIdTypeView: View {
    
    @Binding var docType: String
    
    var body: some View {
        HStack {
            
            if docType.isEmpty {
                Text("Tipo de documento")
            } else {
                Text(docType)
            }
            
            Spacer()
            Menu {
                
                ForEach(DocType.allCases, id: \.rawValue) { type in
                    Button {
                        docType = type.rawValue
                    } label: {
                        Text(type.rawValue)
                    }
                }
                
            } label: {
                Image(systemName: "arrowtriangle.down.fill")
                    .tint(.black)
            }
        }.font(.subheadline)
    }
}



