//
//  TaskFormCoordinator.swift
//  TasksManagerApp
//
//  Created by maxim on 14.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class TaskFormCoordinator: BaseCoordinator {
    
    // MARK: - Public properties

    var onFinishFlow: ((String?) -> Void)?
    
    // MARK: - Private properties
    
    private var navigationViewController = UINavigationController()
    private var taskFormView: TaskFormView?
    private let parentController: UIViewController
    private let task: Task?
    
    // MARK: - Init
    
    init(parentController: UIViewController, task: Task?) {
        self.parentController = parentController
        self.task = task
    }
    
    // MARK: - Puplic methods
    
    override func start() {
        showTaskFormModule()
    }
    
    // MARK: - Private methods
    
    private func showTaskFormModule() {        
        taskFormView = ViewsFactory().createTaskFormView(task)
        guard let taskFormView = taskFormView else { return }
        navigationViewController = UINavigationController(rootViewController: taskFormView)
        taskFormView.onBack = { [weak self] message in
            taskFormView.dismiss(animated: true)
            self?.onFinishFlow?(message)
        }
        taskFormView.onTaskFormProjectsView = {
            let coordinator = TaskFormProjectsCoordinator(navigationController: self.navigationViewController)
            coordinator.onFinishFlow = { [weak self] project in
                taskFormView.viewOutput.project = project
                self?.navigationViewController.popToViewController(taskFormView, animated: true)
                self?.removeDependency(coordinator)
            }
            self.addDependency(coordinator)
            coordinator.start()
        }
        parentController.present(navigationViewController, animated: true)
    }

}
