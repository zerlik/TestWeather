//
//  MainPageViewController.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/11/19.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class MainPageViewController : UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, PageVCProtocol{
    
    private let firstVC = TutorialFirstViewController()
    private let secondVC = TutorialSecondViewController()
    
    public var presenter: PagePresenterProtocol!
    
    private lazy var orderedViewControllers: [UIViewController] = {
        return [ firstVC, secondVC ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        presenter.viewDidLoad()
        viewLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.viewWillAppear()
    }
    
    func showButtonOnFirstView() {
        firstVC.showButton()
    }
    
    func showActionSheet() {
        firstVC.showActionSheet()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            
            return orderedViewControllers.last
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
}

extension MainPageViewController{
    
    private func viewLoad(){
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],  direction: .forward, animated: true, completion: nil)
        }
        
        //TODO: можно было через протокол сделать но кому как нравится
        self.firstVC.nextCallBack = { [unowned self] () in
            self.nextVC()
        }
    }
    
    private func nextVC(){
        if orderedViewControllers[1] != nil {
            setViewControllers([orderedViewControllers[1]],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    
}
