//
//  WatchDocView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 23/12/22.
//

import SwiftUI

struct WatchDocView: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                SendDocHeaderView()
                Text("Documentos")
                    .font(.title3)
                    .fontWeight(.heavy)
                Spacer()

            }
        } .navigationBarBackButtonHidden(true)
    }
}

struct WatchDocView_Previews: PreviewProvider {
    static var previews: some View {
        WatchDocView()
    }
}
