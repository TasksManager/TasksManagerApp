//
//  TaskFormViewOutput.swift
//  TasksManagerApp
//
//  Created by maxim on 14.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

protocol TaskFormViewOutput: AnyObject {
    
    var project: Project? { get set }
    var dateFrom: Date { get set }
    var title: String { get set }
    var description: String { get set }
    var dateTo: Date { get set }
    var color: String? { get set }
    /// Появился контроллер
    func didAppear()
    /// Завершилось создание новой задачи.
    func didCraft(data: TaskModel)
    /// Завершилось редактирования сущестующей задачи.
    func didEdit(data: TaskModel)
}
