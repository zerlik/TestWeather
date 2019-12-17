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
    private var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension AppBaseViewController{
    
    func showNoInetConnectionView(show:Bool){
        //TODO: make snackbar
    }
    
    func setSpinnerOnFullView(){
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    func stopSpiner(){
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func showError(_ error: String) {
        print("error", error)
    }
    
    func showNoInternet(_ error: String) {
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
    
    func showActionSheet(_ text: String?, title: String? ) {
        
    }
    
}


