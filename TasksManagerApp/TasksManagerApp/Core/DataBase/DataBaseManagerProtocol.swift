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
    func fetch(tasks by: NSPredicate) -> Result<[Task], Error>
    func fetch(projects by: NSPredicate) -> Result<[Project], Error>
    func save(task model: TaskModel) -> Error?
    func save(project model: ProjectModel) -> Error?
    func delete(task id: UUID) -> Error?
    func delete(project id: UUID) -> Error?
    
}
