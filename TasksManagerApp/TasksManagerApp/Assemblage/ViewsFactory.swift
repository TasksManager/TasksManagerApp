//
//  ViewsFactory.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

/**
 Пока фабрика сборки контроллеров простая. Но при необходимость её легко можно переделать в абстрактную.
 */

/// Фабрика занимается сборкой контроллеров.
struct ViewsFactory {

    // MARK: - Puplic methods
    
    func createMainTabBarController() -> MainTabBarController {
        let tabBarController = MainTabBarController()
        return tabBarController
    }
    
    func createTaskFormView(_ task: Task?) -> TaskFormView {
        let dbManager = DataBaseManager.instance
        let presenter = TaskFormPresenter(dataBase: dbManager, task: task)
        let taskFormViewController = TaskFormView(presenter)
        return taskFormViewController
    }
    
    func createProjectFormView(_ project: Project?) -> ProjectFormView {
        let dbManager = DataBaseManager.instance
        let presenter = ProjectFormPresenter(dataBase: dbManager, project: project)
        let projectFormViewController = ProjectFormView(presenter)
        presenter.viewInput = projectFormViewController
        return projectFormViewController
    }
    
    func createTasksView() -> TasksView {
        let tasksController = TasksView()
        tasksController.tabBarItem = UITabBarItem(
            title: "Tasks",
            image: UIImage(named: "TasksTabIcon"), tag: 0
        )
        return tasksController
    }
    
    func createProjectsView() -> ProjectsView {
        let presenter = ProjectsPresenter()
        let projectsController = ProjectsView(presenter)
        presenter.viewInput = projectsController
        projectsController.tabBarItem = UITabBarItem(
            title: "Projects",
            image: UIImage(named: "ProjectsTabIcon"), tag: 1
        )
        return projectsController
    }
    
    func createAnaliticView() -> AnalyticView {
        let presenter = AnalyticPresenter()
        let analyticController = AnalyticView(presenter: presenter)
        presenter.viewInput = analyticController
        analyticController.tabBarItem = UITabBarItem(
            title: "Analytic",
            image: UIImage(named: "AnalyticTabIcon"), tag: 2
        )
        return analyticController
    }
    
}
