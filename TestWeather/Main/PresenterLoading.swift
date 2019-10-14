//
//  PresenterLoading.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/13/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

class PresenterLoading{
    
    weak var view: LoadingViewCProtocol?
    var router: RouterProtocol?
    
    func viewDidLoad(){
        
        //get weather data from repo
    }
    
    func willAppear(){
        if let userLocation = LocationHelper.getSavedLocation(){
            router?.navigate(to: .goToWeatherVC())
        }else{
            router?.navigate(to: .goToPageView())
        }
    }
    
   
}

extension PresenterLoading: RemoteDataManagerOutputProtocol{
    func WeatherDataRetrieved(_ data : WeatherModelJson){
// set route router?.navigate(to: .goToWeatherVC())
    }
    
    func onError(_ error: String) {
            // vc present ASheet error
    }
}
