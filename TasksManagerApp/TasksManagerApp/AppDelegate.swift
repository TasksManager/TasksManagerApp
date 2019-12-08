//
//  AppDelegate.swift
//  TasksManagerApp
//
//  Created by maxim on 07.12.2019.
//  Copyright © 2019 maxim. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = self.window ?? UIWindow()
        let rootViewController = ViewController()
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}
