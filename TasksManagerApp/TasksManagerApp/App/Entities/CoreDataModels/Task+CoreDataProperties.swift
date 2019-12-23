//
//  Task+CoreDataProperties.swift
//  TasksManagerApp
//
//  Created by maxim on 12.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//
//

import CoreData
import Foundation


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var body: String?
    @NSManaged public var dateFrom: Date
    @NSManaged public var dateTo: Date
    @NSManaged public var id: UUID
    @NSManaged public var isComplete: NSNumber
    @NSManaged public var project: Project?
    @NSManaged public var title: String

}

extension Task {
    
    func setData(from model: TaskModel) {
        self.id = model.id
        self.dateFrom = model.dateFrom
        self.dateTo = model.dateTo
        self.title = model.title
        self.body = model.body
        self.isComplete = model.isComplete as NSNumber
        self.project = model.project
    }
}
