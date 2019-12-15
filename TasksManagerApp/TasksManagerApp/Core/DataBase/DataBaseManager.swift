//
//  DataBaseManager.swift
//  TasksManagerApp
//
//  Created by maxim on 12.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import CoreData
import Foundation

struct DataBaseManager: DataBaseManagerProtocol {
    
    // Singleton
    static let instance = DataBaseManager()
    
    private init() {}
    
    private let dataBase = CoreDataStack.instance
    
    // MARK: - CRUD
    func add(task model: TaskModel) -> Error? {
        let task = Task(context: dataBase.context)
        task.addData(from: model)
        return dataBase.saveContext()
    }
    
    func add(project model: ProjectModel) -> Error? {
        let task = Project(context: dataBase.context)
        task.addData(from: model)
        return dataBase.saveContext()
    }
    
    func fetchTasks(by: NSPredicate) -> Result<[Task], Error> {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let sort = NSSortDescriptor(key: "dateFrom", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.predicate = by
        do {
            let result = try dataBase.context.fetch(fetchRequest)
            return .success(result)
        } catch let error {
            return .failure(error)
        }
    }
    
    func fetchProjects(by: NSPredicate) -> Result<[Project], Error> {
        let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
        fetchRequest.predicate = by
        do {
            let result = try dataBase.context.fetch(fetchRequest)
            return .success(result)
        } catch let error {
            return .failure(error)
        }
    }
    
    func save(task: Task) -> Error? {
        return nil
    }
    
    func save(project: Project) -> Error? {
        return nil
    }
    
    func delete(tasks: [Int]) -> Error? {
        return nil
    }
    
    func delete(projects: [Int]) -> Error? {
        return nil
    }

}
