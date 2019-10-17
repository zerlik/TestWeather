//
//  Utils.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAnalytics

class UtilsWeather{
    
    class func dissmisVC(view : UIViewController){
        guard view.navigationController?.popViewController(animated: true) != nil else {
            view.dismiss(animated: true, completion: nil)
            return
        }
    }
    class func analiticsG (_ nameEvent: FirebaseAnaliticsName , param : [String:Any]?){
        Analytics.logEvent(nameEvent.rawValue, parameters: param)
    }
}
public enum FirebaseAnaliticsName: String{
    case buttonNext = "PageVEvents_buttonNext"
    case buttonOk = "PageVEvents_buttonOk"
}
