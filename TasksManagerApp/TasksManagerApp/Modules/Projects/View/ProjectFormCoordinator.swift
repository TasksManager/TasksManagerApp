//
//  ProjectFormCoordinator.swift
//  TasksManagerApp
//
//  Created by Mikhail Semerikov on 18.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class ProjectFormCoordinator: BaseCoordinator {

    // MARK: - Public properties
    var onFinishFlow: ((String?) -> Void)?
    
    // MARK: - Private properties
    private let parentController: UIViewController
    private let project: Project?
    
    // MARK: - Init
    init(parentController: UIViewController, project: Project?) {
        self.parentController = parentController
        self.project = project
    }
    
    // MARK: - Puplic methods
    override func start() {
        showProjectFormModule()
    }
    
    // MARK: - Private methods
    private func showProjectFormModule() {
        let controller = ViewsFactory().createProjectFormView(project)
        controller.modalPresentationStyle = .fullScreen
        controller.onBack = { [weak self] message in
            controller.dismiss(animated: true)
            self?.onFinishFlow?(message)
        }
        parentController.present(controller, animated: true)
    }
}
