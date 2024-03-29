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
    private var flagPresentCoordinates : Bool?
    
    deinit {
        NotificationCenter.default.removeObserver(self,  name: .didReceiveLocation, object: nil)
    }
    
    func viewDidLoad(){
        NotificationCenter.default.addObserver( self, selector: #selector(getCoordinates), name: .didReceiveLocation, object: nil)
    }
    
    func willAppear(){
        if let coordinates = LocationHelper.getSavedLocation() {
            remoteDatamanager?.retrieveWeather(lat: coordinates.latitude, long: coordinates.longitude)
        }
        else{
            if flagPresentCoordinates == nil {// wait retreive coordinates
                router?.navigate(to: .goToPageView)
                flagPresentCoordinates = false
            }
        }
    }
    
    @objc private func getCoordinates(notification: NSNotification) {
        flagPresentCoordinates = true
        self.willAppear()
    }
}

extension PresenterLoading: RemoteDataManagerOutputProtocol{
    
    func onError(_ error: NetworkResponseStatus) {
        switch error{
        case .noNetwork: view?.showNoInternet(error.text)
        default: view?.showError(error.text)
        }
    }
    
    func weatherDataRetrieved(_ data: WeatherData) {
            router?.navigate(to: .goToWeatherVC(data))
    }
   
}
