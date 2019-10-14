//
//  NetworkProvider.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/14/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal class NetworkProvider {
    
    public func getWeatherFromNetwork( completion: @escaping (WeatherModelJson?, Error?)->Void ){
        let service = ServiceNetwork()
//        service.getUsers(completion: { (users, err) in
//            return completion (users,err)
//        })
    }
}
