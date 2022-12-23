//
//  IdMenuView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct SendDocIdTypeView: View {
    
    @ObservedObject var vm = SendDocIdTypeViewModel()
    
    var body: some View {
        HStack {
            Text(vm.docType)
            Spacer()
            Menu {
                Button("Cédula de Ciudadanía", action: vm.cc)
                Button("Tarjeta de Identidad", action: vm.ti)
                Button("Pasaporte", action: vm.pa)
                Button("Cédula de Extranjería", action: vm.ce)
            } label: {
                Image(systemName: "arrowtriangle.down.fill")
                    .tint(.black)
            }
        }.font(.subheadline)
    }
}


struct IdMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocIdTypeView()
    }
}
