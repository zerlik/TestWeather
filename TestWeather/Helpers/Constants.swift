//
//  Constants.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/11/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit

public enum Constants {
    
    public static let app = "TestWeather"
    
    public enum AllImages{
        
        public static let sunnyIMG : UIImage = UIImage(named: "images")!
        public static let umbrellaIMG : UIImage = UIImage(named: "og_image")!
        
    }
    
    public enum AllStr{
       public static let locationMessage = "Allow Location Access"
       public static let needAccesMessage = "Weather needs access to your location. Turn on Location Services in your device settings."
    }
}
