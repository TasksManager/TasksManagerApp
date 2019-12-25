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
    private let predicateFactory = PredicateFactory()
    
    // MARK: - CRUD
    func add(task model: TaskModel) -> Error? {
        let task = Task(context: dataBase.context)
        task.setData(from: model)
        return dataBase.saveContext()
    }
    
    func add(project model: ProjectModel) -> Error? {
        let project = Project(context: dataBase.context)
        project.setData(from: model)
        return dataBase.saveContext()
    }
    
    func fetch(tasks by: NSPredicate) -> Result<[Task], Error> {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let sort = NSSortDescriptor(key: "dateFrom", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.predicate = by
        do {
            let tasks = try dataBase.context.fetch(fetchRequest)
            return .success(tasks)
        } catch let error {
            return .failure(error)
        }
    }
    
    func fetch(projects by: NSPredicate) -> Result<[Project], Error> {
        let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
        fetchRequest.predicate = by
        do {
            let projects = try dataBase.context.fetch(fetchRequest)
            return .success(projects)
        } catch let error {
            return .failure(error)
        }
    }
    
    func save(task model: TaskModel) -> Error? {
        let predicate = predicateFactory.predicate(id: model.id)
        let result = fetch(tasks: predicate)
        do {
            let tasks = try result.get()
            guard let task = tasks.first else {
                return DataBaseError.objectWasNotFound
            }
            task.setData(from: model)
        } catch let error {
            return error
        }
        return dataBase.saveContext()
    }
    
    func save(project model: ProjectModel) -> Error? {
        let predicate = predicateFactory.predicate(id: model.id)
        let result = fetch(projects: predicate)
        do {
            let projects = try result.get()
            guard let project = projects.first else {
                return DataBaseError.objectWasNotFound
            }
            project.setData(from: model)
        } catch let error {
            return error
        }
        return dataBase.saveContext()
    }
    
    func delete(task id: UUID) -> Error? {
        let predicate = predicateFactory.predicate(id: id)
        let result = fetch(tasks: predicate)
        switch result {
        case .success(let objects):
            guard let task = objects.first else {
                return DataBaseError.objectWasNotFound
            }
            dataBase.context.delete(task)
            return nil
        case .failure(let error):
            return error
        }
    }
    
    func delete(project id: UUID) -> Error? {
        let predicate = predicateFactory.predicate(id: id)
        let result = fetch(projects: predicate)
        switch result {
        case .success(let objects):
            guard let project = objects.first else {
                return DataBaseError.objectWasNotFound
            }
            dataBase.context.delete(project)
            return nil
        case .failure(let error):
            return error
        }
    }
    
    func deleteProject(project: Project) {
        dataBase.delete(project: project)
    }
    
}
