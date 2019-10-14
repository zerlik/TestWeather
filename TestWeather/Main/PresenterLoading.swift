//
//  PresenterLoading.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/13/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

class PresenterLoading : LoadingPresenterProtocol{
    
    weak var view: LoadingViewCProtocol?
    var router: RouterProtocol?
    
    var remoteDatamanager: RemoteDataManagerInputProtocol?
    
    func viewDidLoad(){
        remoteDatamanager?.retrieveWeather()
    }
    
    func willAppear(){
        guard let _ = LocationHelper.getSavedLocation() else{
            router?.navigate(to: .goToPageView)
            return
        }
    }
}

extension PresenterLoading: RemoteDataManagerOutputProtocol{
    func weatherDataRetrieved(_ data: WeatherModelJson) {
        router?.navigate(to: .goToWeatherVC(data))
    }
    
    func onError(_ error: String) {
            // vc present ASheet error
    }
}
