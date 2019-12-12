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
    
    let id: UUID
    let date: Date
    let title: String
    let isComplete: Bool
    var body: String?
    var project: Project?
    
}
