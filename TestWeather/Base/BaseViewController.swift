//
//  BaseViewController.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//
import UIKit



class AppBaseViewController: UIViewController{
    
//   private var snackBar : UILabel?
//   private var activityIndicator = UIActivityIndicatorView()
    
}

extension AppBaseViewController{

    func showNoInetConnectionView(show:Bool){
        //TODO: make snackbar
    }

    func spinnerOnFullView(_ position:Position){
        //TODO: make spinner
    }
    func stopSpiner(){
//        self.activityIndicator.stopAnimating()
//        self.activityIndicator.removeFromSuperview()
//        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func showError(_ error: String) {
        print("error", error)
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
}

enum Position {
    case left
    case right
    case top
    case bottom
    case forAuth
}


