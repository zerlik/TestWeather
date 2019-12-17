//
//  TutorialFirstViewController.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/11/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import CoreLocation
import FirebaseAnalytics

internal class TutorialFirstViewController:AppBaseViewController {
    
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
    
    public var presenter: PagePresenterProtocol!
    
    let locationViewController = LocationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationViewController.locationManager.delegate = self
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        locationViewController.willAppear()
    }
    
    
    @objc private func buttonAction(sender: UIButton!) {
       UtilsWeather.analiticsG(.buttonOk, param: nil)
        nextCallBack()
    }
    
    private func setUI(){
        
        self.view.addSubview(productImageView)
        nextButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(nextButton)
        self.view.backgroundColor = UIColor.red
        setupAutoLayout()
    }
    
    public func showButton(){
        DispatchQueue.main.async {
            self.nextButton.isHidden = false
        }
    }
    
    public func showActionSheet(){
          DispatchQueue.main.async {
        LocationHelper.alertSettingsMessage(title: Constants.AllStr.locationMessage, message:  Constants.AllStr.needAccesMessage, viewController: self)
        }
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
        if status == .authorizedAlways || status == .authorized || status == .authorizedWhenInUse{
            self.locationViewController.locationManager.requestWhenInUseAuthorization()
            self.locationViewController.locationManager.startUpdatingLocation()
            self.locationViewController.getMyLocation()
            self.nextButton.isHidden = false
        }else{
            self.locationViewController.getPermission()
        }
    }
}
