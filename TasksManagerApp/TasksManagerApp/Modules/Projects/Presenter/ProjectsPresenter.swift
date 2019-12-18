//
//  ProjectsPresenter.swift
//  TasksManagerApp
//
//  Created by Mikhail Semerikov on 15.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import CoreData
import UIKit

final class ProjectsPresenter {
    
    // MARK: - Dependency
    
    weak var viewInput: (UIViewController & ProjectsViewInput)?
    
    // MARK: - Constants
    // MARK: - Public properties
    // MARK: - Private properties
    // MARK: - Init
    // MARK: - Lifecycle ViewController
    // MARK: - Puplic methods
    
    func deleteProject(index: Int) {
        let dbManager = DataBaseManager.instance
        _ = dbManager.delete(projects: [index])
    }
    
    func getCountProjects() -> Int {
        let dbManager = DataBaseManager.instance
        let predicate = NSPredicate(value: true)
        let projects = dbManager.fetchProjects(by: predicate)
        
        let numberOfRowsInSection: Int?
        do {
            numberOfRowsInSection = try projects.get().count
        } catch {
            numberOfRowsInSection = nil
        }
        
        return numberOfRowsInSection ?? 0
    }
    
    func getProjectTitle(index: Int) -> String {
        let dbManager = DataBaseManager.instance
        let predicate = NSPredicate(value: true)
        let projects = dbManager.fetchProjects(by: predicate)
        switch projects {
        case .success(let project):
            return project[index].title
        case .failure(let error):
             return error.localizedDescription
        }
    }
    
    func getDate() -> String {
        let dateManager = DateManager()
        return dateManager.getString(from: Date(), with: .ddMMMMyyyy)
    }
    // MARK: - Private methods
    // MARK: - IBActions
    // MARK: - Buttons methods
    // MARK: - Navigation
    
}

// MARK: - ProjectsViewOotput

extension ProjectsPresenter: ProjectsViewOutput {
   
}
