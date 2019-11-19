//
//  SceneDelegate.swift
//  TabbarVC
//
//  Created by Di Gain on 19/11/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = BaseTabBarController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

