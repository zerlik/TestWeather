//
//  LocationHelper.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/11/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
//import RxCocoa
//import RxSwift

class LocationHelper{
    
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
    
    class func setLocation(locationManager: CLLocation?){
        print("LOCATIOn ===== \(locationManager?.coordinate.latitude)")
        UserDefaults.standard.set(locationManager?.coordinate.latitude , forKey: "lat")
        UserDefaults.standard.set(locationManager?.coordinate.longitude , forKey: "long")
    }
    
    //    class func getSavedLocation()->Observable<String?>{
    //       return UserDefaults.standard.rx.observe(String.self, "long")
    
    class func getSavedLocation()->CLLocationCoordinate2D?{
        guard let longStr =  UserDefaults.standard.string(forKey: "long") , let latStr =  UserDefaults.standard.string(forKey: "lat") else{ return nil }
        guard let longNumb = Double(longStr), let latNumb = Double(latStr) else { return nil }
        return CLLocationCoordinate2D(latitude: latNumb, longitude: longNumb)
    }
    
    class func getLocation(view: UIViewController , locationManager: CLLocationManager){
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse, .authorizedAlways, .authorized:
                locationManager.requestLocation()
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            default:
                LocationHelper.alertSettingsMessage(title: Constants.AllStr.locationMessage, message: Constants.AllStr.needAccesMessage, viewController: view)
            }
        }else{
            LocationHelper.alertSettingsMessage(title: Constants.AllStr.locationMessage, message: Constants.AllStr.needAccesMessage, viewController: view)
        }
    }
    
}

