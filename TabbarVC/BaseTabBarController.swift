//
//  BaseTabBarController.swift
//
//  Created by Di Gain on 30/10/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let settingsVC = SettingsViewController()
        settingsVC.delegate = homeVC

        viewControllers = [
            createController(viewController: homeVC, title: "Home", imageName: ""),
            createController(viewController: settingsVC, title: "Settings", imageName: "")
        ]
    }

    func createController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {

        viewController.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        return viewController
    }
}
