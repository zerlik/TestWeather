//
//  LocationHelper.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/11/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class LocationHelper{
    
    
    //    static func getPermission( completionHandler: @escaping (Bool) -> Void) {
    //
    //        //        //AUTO-LOCATION
    //        let locationManager = CLLocationManager()
    //
    //        if CLLocationManager.locationServicesEnabled() {
    //            locationManager.desiredAccuracy = kCLLocationAccuracyBest
    //
    //            switch CLLocationManager.authorizationStatus() {
    //            case .notDetermined:
    //                locationManager.requestAlwaysAuthorization()
    //                locationManager.requestWhenInUseAuthorization()
    //                locationManager.startUpdatingLocation()
    //                print("mhgkjhkhgjhjjhjhjjjhjjhgjhg")
    //                return completionHandler(true)
    //
    //            case .restricted, .denied:
    //                // Disable location features
    ////                self.locationAlertMessage(viewController: view) { (status) in
    ////                    return completionHandler(status)
    ////                }
    //                print("mhgjhgjhg")
    //            case .authorizedWhenInUse, .authorizedAlways:
    //                // Enable features that require location services here.
    //                                print("Full Access")
    //                return completionHandler(false)
    //            }
    //        }
    //    }
    
    //            (string: "App-Prefs: root= LOCATION_SERVICES"))
    class func alertSettingsMessage(title: String, message: String, viewController: UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return  }
            guard UIApplication.shared.canOpenURL(settingsUrl) else{ return }
  
            UIApplication.shared.open(settingsUrl, completionHandler: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        viewController.present(alert, animated: true, completion:nil)
    }
}
