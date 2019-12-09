//
//  BaseCoordinator.swift
//  TasksManagerApp
//
//  Created by maxim on 08.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

/// Базовый координатор.
class BaseCoordinator {
    var childCoordinator: [BaseCoordinator] = []
    
    func start() {}
    
    func addDependency(_ coordinator: BaseCoordinator) {
        for element in childCoordinator where element === coordinator {
            return
        }
        childCoordinator.append(coordinator)
    }
    
    func removeDependency(_ coordinator: BaseCoordinator?) {
        guard childCoordinator.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinator.reversed()
            .enumerated() where element === coordinator {
                
                childCoordinator.remove(at: index)
                break
        }
    }
    
    func setAsRoot(_ controller: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = controller
    }
}
