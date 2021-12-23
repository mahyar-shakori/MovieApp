//
//  AppDelegate.swift
//  MovieApp
//
//  Created by MahyarShakouri on 8/25/1400 AP.
//

import UIKit
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared().isEnabled = true

        self.window = UIWindow(frame: UIScreen.main.bounds)


        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true


        if UserDefaults.standard.bool(forKey: "isLogin") {
            let rootViewController = storyboard.instantiateViewController(identifier:"homePage") as UIViewController
            navigationController.viewControllers = [rootViewController]
            self.window?.rootViewController = navigationController
        }
        else {
            let rootViewController = storyboard.instantiateViewController(identifier:"login") as UIViewController
            navigationController.viewControllers = [rootViewController]
            self.window?.rootViewController = navigationController
        }
        return true


    }


}

