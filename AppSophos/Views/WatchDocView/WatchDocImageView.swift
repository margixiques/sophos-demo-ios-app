//
//  WatchDocImageView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 9/01/23.
//

import SwiftUI

struct WatchDocImageView: View {
    
    @ObservedObject var vm: WatchDocImageViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {

        NavigationStack{
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                    Text("Regresar")
                    Spacer()
                        
                }.font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("textColorPurple"))
                    .padding()
            }
            Spacer()
            Image(uiImage: vm.image ?? UIImage())
                .resizable()
                .scaledToFit()
                .padding()
                
            Spacer()
                
        } .onAppear {
            Task{
                try await vm.fetchDocument()
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct WatchDocImageView_Previews: PreviewProvider {
    static var previews: some View {
        WatchDocImageView(vm: WatchDocImageViewModel(idRegister: ""))
    }
}
