//
//  TutorialSecondViewController.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/11/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class TutorialSecondViewController: UIViewController {

      private let productImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.clear
        imageView.image = Constants.AllImages.sunnyIMG
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let nextButton : UIButton = {
            let btn = UIButton(type: .custom)
            btn.backgroundColor = UIColor.gray
            btn.setTitle("OK", for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setUI()
        }
        
        @objc private func buttonAction(sender: UIButton!) {
            UtilsWeather.dissmisVC(view : self)
        }
        
        private func setUI(){
            
            self.view.addSubview(productImageView)
            nextButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(nextButton)
            self.view.backgroundColor = UIColor.white
            setupAutoLayout()
        }
        
        private func setupAutoLayout() {
            
            self.productImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            self.productImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.productImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            self.productImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            self.nextButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
            self.nextButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20 ).isActive = true
            self.nextButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70 ).isActive = true
            self.nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
