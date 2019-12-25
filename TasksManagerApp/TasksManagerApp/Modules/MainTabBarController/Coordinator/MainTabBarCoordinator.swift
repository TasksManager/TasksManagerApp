//
//  MainTabBarCoordinator.swift
//  TasksManagerApp
//
//  Created by maxim on 08.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class MainTabBarCoordinator: BaseCoordinator {

    // MARK: - Public properties

    var onFinishFlow: (() -> Void)?

    // MARK: - Private properties
    
    private var tabBarController: MainTabBarController?
    private var tabBarCoordinator: BaseCoordinator?
    
    // MARK: - Puplic methods
    
    override func start() {
        setupTabBarController()
    }
    
    // MARK: - Private methods
    
    private func setupTabBarController() {
        let factory = ViewsFactory()
        let tabBarController = factory.createMainTabBarController()
        let tasksController = factory.createTasksView()
        let projectsController = factory.createProjectsView()
        let analyticController = factory.createAnaliticView()
        tabBarController.viewControllers = [
            tasksController,
            projectsController,
            analyticController
        ]
        tabBarController.toTasks = { [weak self] in
            self?.showNextModule(tasksController)
        }
        tabBarController.toProjects = { [weak self] in
            self?.showNextModule(projectsController)
        }
        tabBarController.toAnalytic = { [weak self] in
            self?.showNextModule(analyticController)            
        }
        setAsRoot(tabBarController)
        self.tabBarController = tabBarController
    }
    
    /// Запускает координатор контроллера, который был нажат в табБаре.
    private func showNextModule(_ controller: UIViewController) {
        
        // swiftlint:disable force_cast
        switch controller {
        case controller as TasksView:
            tabBarCoordinator = TasksCoordinator(controller)
        case controller as ProjectsView:
            tabBarCoordinator = ProjectsCoordinator(controller)
        case controller as AnalyticView:            
            tabBarCoordinator = AnalyticCoordinator(controller as! AnalyticView)
        default:
            break
        }
        
        tabBarCoordinator?.start()
    }
    
}
