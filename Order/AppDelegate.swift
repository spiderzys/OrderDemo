//
//  AppDelegate.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-20.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        coordinator = LoginCoordinator(root: navigationController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator?.start()
        return true
    }

    // MARK: UISceneSession Lifecycle

    

    


}

