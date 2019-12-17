//
//  ProtocolsLoading.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/13/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal protocol LoadingViewCProtocol : class{
    
    //super
       func setSpinnerOnFullView()
       func stopSpiner()
       func showError(_ error: String)
       func showLoading()
       func hideLoading()
     func showNoInternet(_ error: String) 
    
}

internal protocol LoadingPresenterProtocol: class {
    var view: LoadingViewCProtocol? { get set}
    var router: RouterProtocol?{get set}
    var remoteDatamanager: RemoteDataManagerInputProtocol?{get set}
    
    func viewDidLoad()
    func willAppear()
    
}

internal protocol RemoteDataManagerInputProtocol: class{
    var remoteRequestHandler: RemoteDataManagerOutputProtocol? { get set}
    func retrieveWeather(lat: Double, long: Double)
}

internal protocol RemoteDataManagerOutputProtocol: class{
    func weatherDataRetrieved(_ data: WeatherData)
    func onError(_ error: NetworkResponseStatus)
}

