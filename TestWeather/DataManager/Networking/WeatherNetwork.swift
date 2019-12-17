//
//  WeatherNetwork.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 12/15/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal protocol WeatherNetworkProtocols {
    func getWeather(lat: Double, long : Double, completion: @escaping (_ result: WeatherData?, NetworkResponseStatus, Int) -> Void)
}

internal final class WeatherNetwork: WeatherNetworkProtocols {
    
    private let network: NetworkFetchErrors
    
    init(network: NetworkFetchErrors) {
        self.network = network
    }
    
    func getWeather(lat: Double, long : Double, completion: @escaping (_ result: WeatherData?, NetworkResponseStatus, Int) -> Void) {
        
        self.network.genericFetch( MoyaRouterAPI.getWeather(lat: lat, long: long)){ (data: WeatherData?, error, responseCode) in
            completion(data, error, responseCode)
        }
    }
    
}
