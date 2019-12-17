//
//  ProtocolsPageV.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/15/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
internal protocol PageVCProtocol : class{
    func showButtonOnFirstView()
    func showActionSheet()
    
}

internal protocol PagePresenterProtocol: class {
    var view: PageVCProtocol? { get set}
    var router: RouterProtocol?{get set}
    
    func viewDidLoad()
    func viewWillAppear()
}
