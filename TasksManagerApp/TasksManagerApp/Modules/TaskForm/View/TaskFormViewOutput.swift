//
//  TaskFormViewOutput.swift
//  TasksManagerApp
//
//  Created by maxim on 14.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

protocol TaskFormViewOutput: AnyObject {
    
    /// Вызывается после создания новой задачи.
    func didCraft(data: TaskModel)
    /// Вызывается после редактирования сущестующей задачи.
    func didEdit(task: TaskModel)
}
