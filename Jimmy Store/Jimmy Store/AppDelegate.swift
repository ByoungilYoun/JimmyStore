//
//  AppDelegate.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/20.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let navVC = UINavigationController(rootViewController: MainTabBarController())
    window?.rootViewController = navVC
    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
    
    sleep(1)
    
    return true
  }


}

