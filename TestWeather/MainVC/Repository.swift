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
        
        service.getWeatherNetwork().getWeather(lat: lat, long: long) { (dataModel, status, responseCode) in
            
            print("---------status------------- \(status.text)")
            switch status {
                
            case .success:
                if let model = dataModel{
                    self.remoteRequestHandler?.weatherDataRetrieved( model )
                }else{
                    self.remoteRequestHandler?.onError(.unableToDecode)
                }
            default:
                self.remoteRequestHandler?.onError(status)
            }
        }
    }
    
}
