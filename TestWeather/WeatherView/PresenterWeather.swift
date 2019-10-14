//
//  PresenterWeather.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/14/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

class PresenterWeather : WeatherPresenterProtocol{
    
    var view: WeatherViewCProtocol?
    
    var weather: WeatherModelJson!
    
    func viewDidLoad(){
        view?.setUI(self.weather)
    }
}
