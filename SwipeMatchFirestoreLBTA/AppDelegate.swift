//
//  AppDelegate.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = HomeController()
        return true
    }
}

