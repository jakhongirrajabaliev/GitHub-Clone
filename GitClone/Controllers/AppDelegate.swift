//
//  AppDelegate.swift
//  GitClone
//
//  Created by user1 on 12/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            window = UIWindow()
            let vc = SplashVC()
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
            return true
        }
}

