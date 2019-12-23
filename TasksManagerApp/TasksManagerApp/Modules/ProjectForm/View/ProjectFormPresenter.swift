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
    private let dbManager: DataBaseManagerProtocol
    var project: Project?
    
    // MARK: - Init
    required init(dataBase: DataBaseManagerProtocol, project: Project?) {
        self.dbManager = dataBase
        self.project = project
    }
    
    // MARK: - Lifecycle ViewController
    // MARK: - Puplic methods
    func addProject(title: String, color: String) {
        guard let project = self.project else {
            let projectModel = ProjectModel(id: UUID(),
                                            title: title,
                                            color: color,
                                            tasks: nil)
            didCraft(data: projectModel)
            return
        }
        
        let projectModel = ProjectModel(id: project.id,
                                        title: title,
                                        color: color,
                                        tasks: project.tasks as? Set<Task>)
        didEdit(data: projectModel)
    }

    // MARK: - Private methods
    // MARK: - IBActions
    // MARK: - Buttons methods
    // MARK: - Navigation
    
}

// MARK: - ProjectsFormViewOotput

extension ProjectFormPresenter: ProjectFormViewOutput {
    
    func didCraft(data: ProjectModel) {
        if let error = dbManager.add(project: data) {
            viewInput?.show(message: error.localizedDescription)
        } else {
            viewInput?.close(message: "Saved!")
        }
    }
    
    func didEdit(data: ProjectModel) {
        if let error = dbManager.save(project: data) {
            viewInput?.show(message: error.localizedDescription)
        } else {
            viewInput?.close(message: "Saved!")
        }
    }
    
    func didAppear() {
        viewInput?.setData(project: self.project)
    }
   
}
