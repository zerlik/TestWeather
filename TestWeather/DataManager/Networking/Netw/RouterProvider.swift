//
//  RouterProvider.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 12/15/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import Moya

internal class RouterProvider {
    
    public func makeWeatherRouter() -> MoyaProvider<MoyaRouterAPI> {
        return MoyaProvider<MoyaRouterAPI>()
    }
    
}

