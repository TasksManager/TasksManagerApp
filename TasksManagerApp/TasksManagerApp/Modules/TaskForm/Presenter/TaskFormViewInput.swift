//
//  TaskFormViewInput.swift
//  TasksManagerApp
//
//  Created by maxim on 14.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

protocol TaskFormViewInput: AnyObject {
        
    var dateFromLabel: InteractLable { get }
    var dateToLabel: InteractLable { get }
    var projectLabel: InteractLable { get }
    var colorLabel: InteractLable { get }
    var tfTitle: UITextField { get }
    var tfDescription: UITextField { get }
    /// Показывает сообщение в контролере формы.
    func show(message: String)
    /// Закрывает контроллер с возможным сообщением.
    func close(message: String?)
}
