//
//  Utils.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit

class UtilsWeather{
    
    class func dissmisVC(view : UIViewController){
        guard view.navigationController?.popViewController(animated: true) != nil else {
            view.dismiss(animated: true, completion: nil)
            return
        }
    }
}
