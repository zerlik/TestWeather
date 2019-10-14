//
//  BuilderLoading.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/13/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit

internal final class BuilderLoading{
    
    static func make() -> AppBaseNavigationController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: BuilderLoading.self))
        let view = storyboard.instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
        
        guard let cont = view as? LoadingViewController else {
            return AppBaseNavigationController()
        }
        
        let presenter: LoadingPresenterProtocol = PresenterLoading()
        
        cont.presenter = presenter
        
        let navigationController = AppBaseNavigationController(rootViewController: view)
        
        return navigationController
        
    }
}
