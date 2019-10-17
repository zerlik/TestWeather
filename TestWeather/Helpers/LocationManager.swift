//
//  LocationManager.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/16/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationViewController :  UIViewController {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
    }
    
    
    public func willAppear(){
        getPermission()
    }
}

extension LocationViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        getMyLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    public func getPermission(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                
            case .authorizedWhenInUse, .authorizedAlways, .authorized:
                NotificationCenter.default.post(name: .showButtonNext, object: nil)
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
                getMyLocation()
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
                getMyLocation()
                break
            default:
                NotificationCenter.default.post(name: .showSettingActiveSheet, object: nil)
            }
        }else{
            NotificationCenter.default.post(name: .showSettingActiveSheet, object: nil)
        }
    }
    
    public func getMyLocation(){
        guard let currLoc = locationManager.location else{ return }
        let lat : Double = Double(currLoc.coordinate.latitude)
        let long : Double = Double(currLoc.coordinate.longitude)
        NotificationCenter.default.post(name: .didReceiveLocation, object: nil)
         LocationHelper.setLocation(lat: lat, long: long)
    }
}





