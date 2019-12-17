//
//  MoyaRouter.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 12/15/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import Moya

enum MoyaRouterAPI {
    case getWeather(lat: Double, long: Double)
}

extension MoyaRouterAPI: TargetType {
    
    var baseURL: URL {
        
        switch self {
        case .getWeather:
            return URL(string: Constants.endPoint)!
        }
    }
    
    var path: String {
        
        switch self {
        case .getWeather:
            return "/weather"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
        case .getWeather:
            return .get
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        case .getWeather:
            return [:]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getWeather:
            return Data()
        }
    }
    
    var task: Task {
        
        switch self {
        case .getWeather(let lat, let long):
            return .requestParameters(parameters: ["lat": lat,
                                                   "lon": long,
                                                   "appid": Constants.apiId,
                                                   "units": "metric"],
                                      encoding: URLEncoding.default)
        }
    }
}

