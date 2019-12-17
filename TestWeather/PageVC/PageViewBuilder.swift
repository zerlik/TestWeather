//
//  PageViewBuilder.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit

internal final class PageViewBuilder{
    
    static func make() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "PageV", bundle: Bundle(for: PageViewBuilder.self))
        let view = storyboard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        
        guard let cont = view as? MainPageViewController else {
            return UIViewController()
        }
        
        let presenter: PagePresenterProtocol  = PresenterPage()
        let router: RouterProtocol = Router(view: cont)
        
        cont.presenter = presenter
        presenter.view = cont
        presenter.router = router
        
        return cont        
    }
}
