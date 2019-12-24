//
//  TaskFormViewOutput.swift
//  TasksManagerApp
//
//  Created by maxim on 14.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

protocol TaskFormViewOutput: AnyObject {
    
    /// Появился контроллер
    func didAppear()
    /// Завершилось создание новой задачи.
    func didCraft(data: TaskModel)
    /// Завершилось редактирования сущестующей задачи.
    func didEdit(data: TaskModel)
}
