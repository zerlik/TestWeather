//
//  WeatherViewController.swift
//  TestWeather
//
//  Created by Andrei Ziamlianski on 10/12/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController , WeatherViewCProtocol{
    
    @IBOutlet weak var cityImg: UIImageView!
    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    
    public var presenter: WeatherPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    public func setUI(_ data: WeatherModelJson ){
        if let city = data.nameCity {
            nameCity.text = city
            if (city.contains("Horad")){
                
                cityImg.image = Constants.AllImages.cityIMG
            }else{
                cityImg.image = Constants.AllImages.villageIMG
            }
        }
        if let max = data.main?.tempMax{ tempMaxLabel.text = "Temp MAX  = \(max)" }
        if let min = data.main?.tempMin{ tempMinLabel.text = "Temp MIN  = \(min)" }
        
    }
}
