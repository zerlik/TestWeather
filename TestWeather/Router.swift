//
//  Router.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/14/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation

internal enum Route: Equatable {
    case dismissPage()
    case goToWeatherVC()
    case goToPageView()
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        return true
    }
}

internal protocol RouterProtocol: class {
    func navigate(to route: Route)
}


internal final class Router: RouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: ChatRoute) {
        switch route {
        case .dismissPage():
            Utils.dissmisVC(view: view, countVC: 1, animated: true)
        case .goToWeatherVC():
            let weatherVC = WeatherBuilder.make()
            view.present( weatherVC, animated: true, completion: nil)
        case .goToPageView():
            let pageVC = PageViewBuilder.make()
            view.present( pageVC, animated: true, completion: nil)
        }
    }
}
