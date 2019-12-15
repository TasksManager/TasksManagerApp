//
//  DataBaseManagerProtocol.swift
//  TasksManagerApp
//
//  Created by maxim on 12.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

protocol DataBaseManagerProtocol {
    
    func add(task model: TaskModel) -> Error?
    func add(project model: ProjectModel) -> Error?
    func fetchTasks(by: NSPredicate) -> Result<[Task], Error>
    func fetchProjects(by: NSPredicate) -> Result<[Project], Error>
    func save(task: Task) -> Error?
    func save(project: Project) -> Error?
    func delete(tasks: [Int]) -> Error?
    func delete(projects: [Int]) -> Error?
    
}
