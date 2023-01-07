//
//  SendButtonsView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 21/12/22.
//

import SwiftUI

struct SendButtonsView: View {
    
    @ObservedObject var vm = SendDocViewModel()
    
    var body: some View {
        
        
        Button {
            Task{
                await vm.actionButton()
            }
           
        } label: {
            Text("Enviar")
        }
        .fontWeight(.heavy)
        .font(.subheadline)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("colorPink"))
        )
        
    }
}

struct SendButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SendButtonsView()
    }
}
