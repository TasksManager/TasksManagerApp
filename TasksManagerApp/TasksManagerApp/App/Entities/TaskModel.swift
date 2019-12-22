//
//  TaskModel.swift
//  TasksManagerApp
//
//  Created by maxim on 12.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

/// Модель задачи. 
struct TaskModel {
    var brokenRules = [BrokenRule]()
    
    let id: UUID
    var dates: Dates
    var title: String
    var body: String?
    var isComplete: Bool = false
    var project: Project?
    
    init(
        id: UUID,
        dates: Dates,
        title: String,
        body: String? = nil,
        isComplete: Bool = false,
        project: Project? = nil
    ) {
        self.id = id
        self.dates = dates
        self.title = title
        self.body = body
        self.isComplete = isComplete
        self.project = project
    }
    
    init(task: Task) {
        self.id = task.id
        let dates = Dates(task.dateFrom, task.dateTo)
        self.dates = dates
        self.title = task.title
        self.body = task.body
        // swiftlint:disable force_cast
        self.isComplete = task.isComplete as! Bool
        self.project = task.project
    }
}

extension TaskModel {
    
    var isValid: Bool {
        mutating get {
            self.brokenRules = [BrokenRule]()
            self.validate()
            return self.brokenRules.count == 0 ? true : false
        }
    }
    
    mutating private func validate() {
        if title.count > 25 {
            self.brokenRules.append(BrokenRule(
                propertyName: "title",
                message: "Название задачи превышает 25 символов!"
            ))
        }
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.brokenRules.append(BrokenRule(
                propertyName: "title",
                message: "Название задачи не может быть пустым!"
            ))
        }
        if let body = body, body.count > 100 {
            self.brokenRules.append(BrokenRule(
                propertyName: "body",
                message: "Описание задачи превышает 100 символов!"
            ))
        }
        if dates.dateFrom > dates.dateTo {
            self.brokenRules.append(BrokenRule(
                propertyName: "dates",
                message: "Дата окончания не может быть раньше даты начала!"
            ))
        }
    }
    
}

struct Dates {
    var dateFrom: Date
    var dateTo: Date
    
    init(_ from: Date, _ to: Date) {
        self.dateFrom = from
        self.dateTo = to
    }
}
