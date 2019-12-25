//
//  Project+CoreDataProperties.swift
//  TasksManagerApp
//
//  Created by maxim on 12.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//
//

import CoreData
import Foundation


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var color: String?
    @NSManaged public var tasks: NSSet?

}

// MARK: - Generated accessors for tasks
extension Project {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}

extension Project {
    
    func setData(from model: ProjectModel) {
        self.id = model.id
        self.title = model.title
        self.color = model.color
        self.tasks = model.tasks as NSSet?
    }
}
