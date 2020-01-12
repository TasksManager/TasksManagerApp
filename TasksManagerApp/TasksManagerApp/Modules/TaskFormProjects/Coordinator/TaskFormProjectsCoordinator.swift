//
//  TaskFormProjectsCoordinator.swift
//  TasksManagerApp
//
//  Created by maxim on 30.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class TaskFormProjectsCoordinator: BaseCoordinator {
    
    // MARK: - Public properties

    var onFinishFlow: ((Project?) -> Void)?
    
    // MARK: - Private properties
    
    private var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
       
    // MARK: - Puplic methods
    
    override func start() {
        showTaskFormProjectsModule()
    }
    
    // MARK: - Private methods
    
    private func showTaskFormProjectsModule() {
        let controller = ViewsFactory().createTaskFormProjectsView()
        controller.onBack = { [weak self] project in
            self?.onFinishFlow?(project)
        }
        navigationController.pushViewController(controller, animated: true)
    }}
