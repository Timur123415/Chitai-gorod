//
//  LocationManager:.swift
//  Chitai-gorod
//
//  Created by Тимур Белов  on 14.02.2025.
//

import SwiftUI
import MapKit
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        manager.delegate = self
        // Запрашиваем разрешение на использование геолокации
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    // Метод делегата обновления местоположения
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.first else { return }
        DispatchQueue.main.async {
            self.location = loc
        }
    }
}

