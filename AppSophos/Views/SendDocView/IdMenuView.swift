//
//  IdMenuView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct IdMenuView: View {
    
    @State var typeDoc: String = "Tipo de documento"
    var body: some View {
        HStack {
            Text(typeDoc)
            Spacer()
            Menu {
                Button("Cédula de Ciudadanía", action: cc)
                Button("Tarjeta de Identidad", action: ti)
                Button("Pasaporte", action: pa)
                Button("Cédula de Extranjería", action: ce)
            } label: {
                Image(systemName: "arrowtriangle.down.fill")
                    .tint(.black)
            }
        }
        .font(.subheadline)
    }
    
    func cc() { typeDoc = "Cédula de Ciudadanía" }
    func ti() { typeDoc = "Tarjeta de Identidad" }
    func pa() { typeDoc = "Pasaporte" }
    func ce() { typeDoc = "Cédula de Extranjería"}
}


struct IdMenuView_Previews: PreviewProvider {
    static var previews: some View {
        IdMenuView()
    }
}
