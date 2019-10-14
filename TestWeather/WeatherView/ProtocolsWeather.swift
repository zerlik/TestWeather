//
//  ProtocolsWeather.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/14/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
internal protocol WeatherViewCProtocol : class{
    func setUI(_ data: WeatherModelJson )
}

internal protocol WeatherPresenterProtocol: class {
    var view: WeatherViewCProtocol? { get set}
    var weather: WeatherModelJson!{get set}
    func viewDidLoad()
}
