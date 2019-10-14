//
//  Api.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit

class ServiceNetwork{

   static let shared = ServiceNetwork()

    private init(){}

//    class ServiceNetwork : ServiceNetworkProtocol{
//        
//        init(){}
//        
//        func getUsers( completion: @escaping ( Users,Error?)->Void ){
//            
//            guard let url = URL(string: Constant.urlPoint) else{ return }
//            let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
//                
//                guard let data = data else { return }
//                guard let users = try? JSONDecoder().decode(Users.self, from: data) else {return}
//                return completion(users, nil)
//            }
//            task.resume()
//        }
//    }

    
    
    func getW( completion: @escaping ( WeatherModelJson,Error?)->Void ){

        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=53.890961&lon=27.585833&appid=aeb46271e330b0e38e34ba813a0c6a4f&units=metric") else{ return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else { return }
            guard let users = try? JSONDecoder().decode(WeatherModelJson.self, from: data) else {return}
            return completion(users, nil)
        }
        task.resume()
    }
}


import Foundation
import Moya
// http://api.openweathermap.org/data/2.5/weather    ?lat=53& lon=27& appid=aeb46271e330b0e38e34ba813a0c6a4f& units=metric
//?lat=\(lat)&lon=\(lon)&appid=\(UserKey.userApiKey)&units=metric
enum MoyaServiceApi {
    case getWeather(lat: String, long: String)
}

extension MoyaServiceApi: TargetType {
    
    var baseURL: URL { return URL(string: "http://api.openweathermap.org/data/2.5/weather")! }
    
    var headers: [String : String]? {
         switch self{
         case .getWeather:
            return ["Content-Type": "application/json"]
        }
    }
    
    var path: String { return "" }
    
    var method: Moya.Method {
        switch self{
        case .getWeather:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self{
        case .getWeather(let lat, let lon):
        //            return nil
                        return ["lat": lat, "lon": lon, "appid" : "aeb46271e330b0e38e34ba813a0c6a4f", "units": "metric"]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self{
        case .getWeather:
        return .requestPlain
        }
    }
}


