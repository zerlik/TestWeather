//
//  BundleHelper.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/11/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
open class BundleHelper {
    
    static func bundle() -> Bundle? {
        let podBundle = Bundle(for: BundleHelper.self)
        if let url = podBundle.url(forResource: Constants.app, withExtension: "bundle") {
            return Bundle(url: url)
        }
        return nil
    }
}
