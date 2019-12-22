//
//  ProjectModel.swift
//  TasksManagerApp
//
//  Created by maxim on 12.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

/// Модель проекта.
struct ProjectModel {
    var brokenRules = [BrokenRule]()
    
    let id: UUID
    var title: String
    var color: String?
    var tasks: Set<Task>?
    
    init(id: UUID, title: String, color: String? = nil, tasks: Set<Task>? = nil) {
        self.id = id
        self.title = title
        self.color = color
        self.tasks = tasks
    }
    
    init(project: Project) {
        self.id = project.id
        self.title = project.title
        self.color = project.color
        self.tasks = project.tasks as? Set<Task>
    }
}

extension ProjectModel {
    
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
                message: "Название проекта превышает 25 символов!"
            ))
        }
        
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.brokenRules.append(BrokenRule(
                propertyName: "title",
                message: "Название проекта не может быть пустым!"
            ))
        }
    }
    
}
