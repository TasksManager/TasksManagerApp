//
//  TasksCoordinator.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class TasksCoordinator: BaseCoordinator {

    // MARK: - Private properties
    
    private let controller: UIViewController
    
    // MARK: - Init
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    // MARK: - Puplic methods
    
    override func start() {
        showTasksModule()
    }
    
    // MARK: - Private methods
    
    private func showTasksModule() {
        
        controller.tabBarController?.selectedIndex = controller.tabBarItem.tag
    }


}
