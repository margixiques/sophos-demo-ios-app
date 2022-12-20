//
//  IdMenuView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct IdMenuView: View {
    var body: some View {
        HStack {
            
            Text("Tipo de documento")
            Spacer()
            Menu {
                Button("Cédula de Ciudadanía", action: cc)
                Button("Tarjeta de identidad", action: ti)
                Button("Pasaporte", action: pa)
                Button("Cédula de Extranjería", action: ce)
            } label: {
                Image(systemName: "arrowtriangle.down.fill")
                    .tint(.black)
            }
        }
        .font(.subheadline)
    }
    
    func cc() { }
    func ti() { }
    func pa() { }
    func ce() { }
}


struct IdMenuView_Previews: PreviewProvider {
    static var previews: some View {
        IdMenuView()
    }
}
