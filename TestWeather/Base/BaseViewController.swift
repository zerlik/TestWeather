//
//  BaseViewController.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class BaseLocationViewController :  UIViewController {
    
    let locationManager = CLLocationManager()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() ==  .authorizedAlways{
            LocationHelper.setLocation(locationManager: locationManager.location )
        }        
    }
}

extension BaseLocationViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorized || status == .authorizedWhenInUse{
            locationManager.requestLocation()
        }else{
            LocationHelper.getLocation(view: self, locationManager: locationManager)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currLoc = locations.last { LocationHelper.setLocation(locationManager: currLoc) }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    }
}

