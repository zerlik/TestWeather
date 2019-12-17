//
//  Network.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 12/15/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal struct NetworkFetchErrors {
    
    func genericFetch<T: Decodable>(_ target: MoyaRouterAPI, completion: @escaping (T?, NetworkResponseStatus, Int) -> Void) {//apiResponse,NetworkResponse,statusCode
        
        let router = RouterProvider().makeWeatherRouter()
        
        router.request(target) { (result) in
            
            guard NetworkPresentHelper.isInternetAvailable() else{
                return completion(nil, NetworkResponseStatus.noNetwork, 0)
            }
            
            switch result {
                
            case .success(let response):
                
                guard response.data != nil else {
                    completion(nil, NetworkResponseStatus.noData, response.statusCode)
                    return
                }
                
                do {
                    let apiResponse = try JSONDecoder().decode(T.self, from: response.data)
                    completion(apiResponse, NetworkResponseStatus.success, response.statusCode)
                } catch {
                    completion(nil, NetworkResponseStatus.unableToDecode, response.statusCode)
                }
                
            case .failure(let error):
                completion(nil, NetworkResponseStatus.failed, error.errorCode)
            }
            
        }
    }
    
}

internal enum NetworkResponseStatus: String {
    case success
    case authenticationError
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case noNetwork = "No Internet connections"
    
    var text: String {
        switch self {
        case .success :
            return "Ok"
        case .authenticationError :
            return "You need to be authenticated first."
        case .badRequest :
            return "Bad request"
        case .outdated :
            return "The url you requested is outdated."
        case .failed :
            return"Network request failed."
        case .noData :
            return "Response returned with no data to decode."
        case .unableToDecode :
            return "We could not decode the response."
        case .noNetwork :
            return "No Internet connections"
        }
    }
}

internal enum Result<String> {
    case success
    case failure(String)
}
