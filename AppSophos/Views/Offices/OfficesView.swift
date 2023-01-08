//
//  OfficesView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 23/12/22.
//

import SwiftUI
import MapKit

struct OfficesView: View {
    
    @StateObject var manager = LocationManager()
    
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                SendDocHeaderView()
                Text("Oficinas")
                    .font(.title3)
                    .fontWeight(.heavy)
                
                Map(coordinateRegion: $manager.region,
                    interactionModes: MapInteractionModes.all,
                    showsUserLocation: true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

            }
        } .navigationBarBackButtonHidden(true)
    }
}

//struct OfficesView_Previews: PreviewProvider {
//    static var previews: some View {
//        OfficesView(location: MapDirectory().offices[0])
//    }
//}



