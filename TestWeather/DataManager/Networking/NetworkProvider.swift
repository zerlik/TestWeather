//
//  NetworkProvider.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/14/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal class NetworkProvider {
   
    public func getWeatherNetwork() -> WeatherNetwork {
           let network = NetworkFetchErrors()
           return WeatherNetwork(network: network)
       }
}
