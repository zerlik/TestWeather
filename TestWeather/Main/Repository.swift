//
//  Repository.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/14/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal class RemoteDataManager: RemoteDataManagerInputProtocol {
    
    private let service: NetworkProvider
    var remoteRequestHandler: RemoteDataManagerOutputProtocol?
    
    init(service: NetworkProvider) {
        self.service = service
    }
    
    func retrieveWeather(lat: Double, long: Double){
        service.getWeatherFromNetwork { (weather , error) in
            if let err = error as? String {
                self.remoteRequestHandler?.onError(err)
            }
            if weather != nil{ self.remoteRequestHandler?.weatherDataRetrieved(weather!) }
        }
    }
}
