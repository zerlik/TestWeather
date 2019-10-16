//
//  ProtocolsLoading.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/13/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal protocol LoadingViewCProtocol : class{
    
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
    func weatherDataRetrieved(_ data: WeatherModelJson)
    func onError(_ error: String)
}

