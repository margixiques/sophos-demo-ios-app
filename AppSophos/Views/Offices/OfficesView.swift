//
//  OfficesView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 23/12/22.
//

import SwiftUI

struct OfficesView: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                SendDocHeaderView()
                Text("Oficinas")
                    .font(.title3)
                    .fontWeight(.heavy)
                Spacer()

            }
        } .navigationBarBackButtonHidden(true)
    }
}

struct OfficesView_Previews: PreviewProvider {
    static var previews: some View {
        OfficesView()
    }
}
