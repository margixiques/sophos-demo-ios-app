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
    //@ObservedObject var vm = OfficesViewModel()
    
    @State var tracking: MapUserTrackingMode = .none
    
    @State var offices: [Office] = []
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                
                SendDocHeaderView()
                
                Text("Oficinas")
                    .font(.title3)
                    .fontWeight(.heavy)
                
                Map(coordinateRegion: $manager.region,
                    interactionModes: MapInteractionModes.all,
                    showsUserLocation: true,
                    userTrackingMode: $tracking,
                    annotationItems: offices) { office in
                    MapAnnotation(
                        coordinate: CLLocationCoordinate2D(
                            latitude: office.latitude,
                            longitude: office.longitude)
                    ) {
                        VStack {
                            Text(office.name)
                                .font(.caption)
                                .padding(10)
                                .background{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.white)
                                }
                            Image(systemName: "mappin.and.ellipse")
                                .font(.title2)
                                .foregroundColor(.red)
                                .shadow(radius: 1)
                        }
                    }
                }
            } .navigationBarBackButtonHidden(true)
                .onAppear(perform: readFile)
        }
    }
    
    func readFile() {
        if let url = Bundle.main.url(forResource: "Offices", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let officesList = try? decoder.decode(OfficeList.self, from: data) {
                self.offices = officesList.offices
            }
        }
    }
}






