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
    private let controller: ProjectsView
    
    // MARK: - Init
    init(_ controller: ProjectsView) {
        self.controller = controller
    }
    
    // MARK: - Puplic methods
    override func start() {
        showProjectsModule()
    }
    
    // MARK: - Private methods
    private func showProjectsModule() {
        controller.tabBarController?.selectedIndex = controller.tabBarItem.tag
        controller.onProjectForm = { [weak self] project in
            guard  let self = self else { return }
            let coordinator = ProjectFormCoordinator(
                parentController: self.controller,
                project: project
            )
            coordinator.onFinishFlow = { [weak self, weak coordinator] message in
                self?.removeDependency(coordinator)
                self?.start()
            }
            self.addDependency(coordinator)
            coordinator.start()
        }
    }
}
