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
    
    let id: UUID
    let title: String
    var color: String?
    var tasks: Set<Task>?
    
}
