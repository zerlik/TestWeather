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
        public static let cityIMG : UIImage = UIImage(named: "city")!
        public static let villageIMG : UIImage = UIImage(named: "village")!
    }
    
    public enum AllStr{
        
        public static let locationMessage : String = "Allow Location Access"
        public static let needAccesMessage : String = "Weather needs access to your location. Turn on Location Services in your device settings."
    }
    
    public enum NetworkApi{
    public static let userApiKey: String = "aeb46271e330b0e38e34ba813a0c6a4f"
    public static let endPointApi: String = "http://api.openweathermap.org/data/2.5/weather"
    }
}

