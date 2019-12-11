//
//  ProgectsCoordinator.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class ProjectsCoordinator: BaseCoordinator {

    // MARK: - Private properties
    
    private let controller: UIViewController
    
    // MARK: - Init
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    // MARK: - Puplic methods
    
    override func start() {
        controller.tabBarController?.selectedIndex = controller.tabBarItem.tag
    }
    
    // MARK: - Private methods
    
    private func showProjectsModule() {
        
    }


}
