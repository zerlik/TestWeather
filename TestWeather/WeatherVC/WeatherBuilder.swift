//
//  WeatherBuilder.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit

internal final class WeatherBuilder{
    
    static func make(data: WeatherData) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Weather", bundle: Bundle(for: WeatherBuilder.self))
        let view = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        
        guard let cont = view as? WeatherViewController else {
            return UIViewController()
        }
        
        let presenter: WeatherPresenterProtocol = PresenterWeather()
        cont.presenter = presenter
        presenter.view = cont
        presenter.weather = data
        
        return cont
      
    }
}
