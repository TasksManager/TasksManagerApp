//
//  ProjectsFormPresenter.swift
//  TasksManagerApp
//
//  Created by Mikhail Semerikov on 18.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import CoreData
import UIKit

final class ProjectFormPresenter {
    
    // MARK: - Dependency
    
    weak var viewInput: (UIViewController & ProjectFormViewInput)?
    
    // MARK: - Constants
    // MARK: - Public properties
    // MARK: - Private properties
    // MARK: - Init
    // MARK: - Lifecycle ViewController
    // MARK: - Puplic methods
    func addProject(title: String, color: String) {
        let projectModel = ProjectModel(id: UUID(), title: title, color: color, tasks: nil)
        let dbManager = DataBaseManager.instance
        _ = dbManager.add(project: projectModel)
    }

    // MARK: - Private methods
    // MARK: - IBActions
    // MARK: - Buttons methods
    // MARK: - Navigation
    
}

// MARK: - ProjectsFormViewOotput

extension ProjectFormPresenter: ProjectFormViewOutput {
   
}
