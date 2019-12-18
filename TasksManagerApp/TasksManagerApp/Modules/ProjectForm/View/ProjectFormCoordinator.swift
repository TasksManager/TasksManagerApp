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
    var onFinishFlow: (() -> Void)?
    
    // MARK: - Private properties
    private let parentController: UIViewController
    
    // MARK: - Init
    init(parentController: UIViewController) {
        self.parentController = parentController
    }
    
    // MARK: - Puplic methods
    override func start() {
        showProjectFormModule()
    }
    
    // MARK: - Private methods
    private func showProjectFormModule() {
        let controller = ViewsFactory().createProjectFormView()
        controller.modalPresentationStyle = .fullScreen
        controller.onBack = { [weak self] in
            controller.dismiss(animated: true)
            self?.onFinishFlow?()
        }
        parentController.present(controller, animated: true)
    }
}
