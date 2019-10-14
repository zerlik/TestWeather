//
//  WeatherModelJSON.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

struct WeatherModelJson : Codable{
    
    let main : MainWeatherModelJson?
    let nameCity : String?
    
    enum CodingKeys : String, CodingKey {
        
        case main
        case nameCity = "name"
    }
}

extension WeatherModelJson{
    
    struct MainWeatherModelJson : Codable{
        
        let temp : Double?
        let pressure : Double?
        let tempMin: Double?
        let tempMax: Double?
        
        enum CodingKeys : String, CodingKey {
            case temp
            case pressure
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }
}

//{
//    "coord":{
//        "lon":27,"lat":53
//    },
//"weather":[
//{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}
//],
//"base":"stations",
//"main":{"temp":12.54,"pressure":1012.43,"humidity":75,"temp_min":12.54,"temp_max":12.54,"sea_level":1012.43,"grnd_level":992.41},
//"wind":{"speed":5.93,"deg":241.435},
//"clouds":{"all":21},
//"dt":1570904562,
//"sys":{"message":0.0063,"country":"BY","sunrise":1570854704,"sunset":1570893909},
//"timezone":10800,
//"id":625143,
//"name":"Horad Minsk",
//"cod":200
//}
