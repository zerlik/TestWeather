//
//  TutorialFirstViewController.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/11/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import CoreLocation

internal class TutorialFirstViewController: UIViewController {
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.clear
        imageView.image = Constants.AllImages.umbrellaIMG
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nextButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.isHidden = true
        btn.backgroundColor = UIColor.gray
        btn.setTitle("Next", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    typealias callBackData = () -> ()
    var nextCallBack: callBackData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        self.view.addSubview(productImageView)
        nextButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(nextButton)
        self.view.backgroundColor = UIColor.red
        setupAutoLayout()
        
        chechkLocationService()
        chechkLoc()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    private let locationManager = CLLocationManager()
    
    private func chechkLocationService(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }else{
            LocationHelper.alertSettingsMessage(title: Constants.AllStr.locationMessage, message: Constants.AllStr.needAccesMessage, viewController: self)
        }
    }
    
    private func chechkLoc(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            self.nextButton.isHidden = false
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        default:
            break
        }
    }
    
    @objc private func buttonAction(sender: UIButton!) {
        nextCallBack()
    }
    
    private func setupAutoLayout() {
        
        self.productImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.productImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.productImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.productImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.nextButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.nextButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20 ).isActive = true
        self.nextButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70 ).isActive = true
        self.nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

extension TutorialFirstViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            self.nextButton.isHidden = false
        }else{
            LocationHelper.alertSettingsMessage(title: Constants.AllStr.locationMessage, message: Constants.AllStr.needAccesMessage, viewController: self)
        }
    }
}
