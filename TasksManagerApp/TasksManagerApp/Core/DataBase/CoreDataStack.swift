//
//  CoreDataStack.swift
//  TasksManagerApp
//
//  Created by maxim on 12.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import CoreData
import Foundation

class CoreDataStack {
    
    // Singleton
    static let instance = CoreDataStack()
    
    private init() {}
    
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
