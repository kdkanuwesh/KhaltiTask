//
//  AppDelegate.swift
//  Task
//
//  Created by Anuwesh Khadka on 20/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        let navViewController = UINavigationController(rootViewController: TabbarVC())
        window?.rootViewController = navViewController
        window?.makeKeyAndVisible()
      
        return true
    }
}

