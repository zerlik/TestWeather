//
//  LoadingViewController.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import CoreLocation

class LoadingViewController: BaseLocationViewController, LoadingViewCProtocol {
    
    public var presenter: LoadingPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.willAppear()
       
    }
}



