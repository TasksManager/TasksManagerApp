//
//  AnalyticCoordinator.swift
//  TasksManagerApp
//
//  Created by maxim on 08.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class AnalyticCoordinator: BaseCoordinator {
    
    // MARK: - Private properties
    
    private let controller: AnalyticView
    
    // MARK: - Init
    
    init(_ controller: AnalyticView) {
        self.controller = controller
    }
    
    // MARK: - Puplic methods
    
    override func start() {
        showAnalyticModule()
    }
    
    // MARK: - Private methods
    
    private func showAnalyticModule() {
        controller.tabBarController?.selectedIndex = controller.tabBarItem.tag
        
        // FIXME: - Убрать! Оставил потому, что нужна кнопка пререхода на форму.
        controller.onTaskForm = { [weak self] in
            guard  let self = self else { return }
            let coordinator = TaskFormCoordinator(
                parentController: self.controller,
                task: nil
            )
            coordinator.onFinishFlow = { [weak self, weak coordinator] (message) in
                print(message ?? "")
                self?.removeDependency(coordinator)
                self?.start()
                
            }
            self.addDependency(coordinator)
            coordinator.start()
        }
    }

}
