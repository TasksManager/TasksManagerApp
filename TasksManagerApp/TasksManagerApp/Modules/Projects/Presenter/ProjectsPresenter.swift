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
    let dbManager = DataBaseManager.instance
    let predicate = NSPredicate(value: true)
    var arrayProjects: [Project]?
    // MARK: - Public properties
    // MARK: - Private properties
    // MARK: - Init
    // MARK: - Lifecycle ViewController
    // MARK: - Puplic methods
    
    func deleteProject(index: Int) {
        guard let project = arrayProjects?[index] else { return }
        dbManager.deleteProject(project: project)
        arrayProjects?.remove(at: index)
    }
    
    func getProject(index: Int) -> Project? {
        return arrayProjects?[index]
    }
    
    func getProjects() {
        let projects = dbManager.fetchProjects(by: predicate)
        do {
            arrayProjects = try projects.get()
        } catch {
            arrayProjects = nil
        }
    }
    
    func getCountProjects() -> Int {
        getProjects()
        return arrayProjects?.count ?? 0
    }
    
    func getProjectTitle(index: Int) -> String {
        return arrayProjects?[index].title ?? "Title not found"
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
