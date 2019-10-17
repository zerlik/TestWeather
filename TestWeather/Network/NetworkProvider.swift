//
//  NetworkProvider.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/14/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal class NetworkProvider {
    
    public func getWeatherFromNetwork( lat: Double, long: Double, completion: @escaping (WeatherModelJson?, Error?)->Void ){
        let service = ServiceNetwork()
        service.getWeather( lat: lat, long: long, completion: { (weather, err) in
            return completion (weather,err)
        })
    }
}
