//
//  AppCoordinator.swift
//  TasksManagerApp
//
//  Created by maxim on 08.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

/// Главный координатор приложения. Здесь можно, например, проверять авторизацию пользователя.
class AppCoordinator: BaseCoordinator {
    
    // MARK: - Private properties
    
    private var window: UIWindow
    
    // MARK: - Init
    
    init(_ window: UIWindow) {
        self.window = window
    }

    // MARK: - Puplic methods
    
    override func start() {
        self.window.makeKeyAndVisible()
        setupMainTabBarController()
    }
    
    // MARK: - Private methods
    
    private func setupMainTabBarController() {
        let coordinator = MainTabBarCoordinator()
        coordinator.onFinishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
 
}
