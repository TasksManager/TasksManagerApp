//
//  TabBarControllerViewController.swift
//  TasksManagerApp
//
//  Created by maxim on 08.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Navigation
    
    var toTasks: (() -> Void)?
    var toProjects: (() -> Void)?
    var toAnalytic: (() -> Void)?


    // MARK: - Lifecycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        toTasks?()
    }
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController) -> Bool {

        switch viewController {
        case viewController as TasksView:
            toTasks?()
        case viewController as ProjectsView:
            toProjects?()
        case viewController as AnalyticView:
            toAnalytic?()
        default:
            break
        }
        
        return false
    }
}
