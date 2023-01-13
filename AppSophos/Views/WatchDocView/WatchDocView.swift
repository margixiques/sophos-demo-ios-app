//
//  WatchDocView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 23/12/22.
//

import SwiftUI

struct WatchDocView: View {
    
    @ObservedObject var vm = WatchDocViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack (spacing: 20){
                
                SendDocHeaderView()
                Text("Documentos")
                    .font(.title3)
                    .fontWeight(.heavy)
                Spacer()
                
                List(vm.items, id: \.idRegister) { item in
                    NavigationLink {
                        WatchDocImageView(vm: WatchDocImageViewModel(idRegister: item.idRegister))
                    } label: {
                        VStack(alignment: .leading) {
                            
                            Text(vm.getDate(from: item.date) + " - " + item.attachmentType)
                                .padding(.bottom, 10)
                            Text(item.name + " " + item.lastname)
                        }
                        .padding()
                        .font(.subheadline)
                    }
                }
            }
        } .navigationBarBackButtonHidden(true)
            .onAppear {
                Task {
                    do {
                        try await vm.loadData()
                    } catch {
                        
                    }
                }
            }
    }
}

struct WatchDocView_Previews: PreviewProvider {
    static var previews: some View {
        WatchDocView()
    }
}
