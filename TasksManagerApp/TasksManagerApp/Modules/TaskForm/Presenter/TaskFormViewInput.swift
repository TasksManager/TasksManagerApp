//
//  TaskFormViewInput.swift
//  TasksManagerApp
//
//  Created by maxim on 14.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

protocol TaskFormViewInput: AnyObject {
        
    /// Устанавливает начальные данные.
    func setData(task: Task?)
    /// Показывает сообщение в контролере формы.
    func show(message: String)
    /// Закрывает контроллер с возможным сообщением.
    func close(message: String?)
}
