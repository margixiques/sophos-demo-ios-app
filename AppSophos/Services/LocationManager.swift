//
//  LocationManager.swift
//  AppSophos
//
//  Created by Margarita Xiques on 7/01/23.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var region = MKCoordinateRegion()
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
    }
}

