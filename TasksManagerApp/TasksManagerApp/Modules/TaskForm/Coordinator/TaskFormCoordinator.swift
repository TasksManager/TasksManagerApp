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
        let controller = ViewsFactory().createTaskFormView(task)
        controller.onBack = { [weak self] message in
            controller.dismiss(animated: true)
            self?.onFinishFlow?(message)
        }
        parentController.present(controller, animated: true)
    }

}
