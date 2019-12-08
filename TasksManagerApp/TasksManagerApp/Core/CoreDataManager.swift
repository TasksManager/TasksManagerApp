//
//  CoreDataManager.swift
//  CDMigration
//
//  Created by maxim on 11/11/2019.
//  Copyright © 2019 maxim. All rights reserved.
//

import CoreData
import Foundation

class CoreDataManager {
    
    // Singleton
    static let instance = CoreDataManager()
    
    private init() {}
    
    // MARK: - CRUD

    /// Запрашивает записи.
    /// - Parameters:
    ///   - predicate: Предикат.
    ///   - limit: Лимит. Если нужно последнее значение, то устанавливаем его в 1.
    func fetch(with predicate: NSPredicate, limit: Int = 1000) -> [ENTRY]? {
//        let fetchRequest: NSFetchRequest<ENTRY> = ENTRY.fetchRequest()
//        let sort = NSSortDescriptor(key: "date", ascending: false)
//        fetchRequest.sortDescriptors = [sort]
//        fetchRequest.predicate = predicate
//        fetchRequest.fetchLimit = limit
//        do {
//            let result = try context.fetch(fetchRequest)
//            return result
//        } catch {
            return nil
//        }
    }
    
    /// Добавляет запись.
    /// - Parameter entry: Данные для записи в виде структуры.
    func add(entry: ENTRY) -> Error? {
        return saveContext()
    }
    
    /// Удаляет запись
    /// - Parameter entry: Запись.
    func delete(entry: ENTRY) -> Error? {
            return saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "TasksManagerApp")
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext() -> Error? {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                return error
            }
        }
        return nil
    }
    
}
