//
//  PresenterPageV.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/15/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
class PresenterPage : PagePresenterProtocol{
    
    weak var view: PageVCProtocol?
    var router: RouterProtocol?
    
    deinit {
        NotificationCenter.default.removeObserver(self,  name: .showSettingActiveSheet, object: nil)
        NotificationCenter.default.removeObserver(self,  name: .showButtonNext, object: nil)
    }
    
    func viewWillAppear() {
        
    }
    
    
    func viewDidLoad(){
        NotificationCenter.default.addObserver( self, selector: #selector(showActionSheet), name: .showSettingActiveSheet, object: nil)
        NotificationCenter.default.addObserver( self, selector: #selector(showButtonNext), name: .showButtonNext, object: nil)
    }
    @objc private func showButtonNext(){
        if view != nil{ view!.showButtonOnFirstView() }
    }
    @objc private func showActionSheet(){
        if view != nil{ view!.showActionSheet() }
    }
}

