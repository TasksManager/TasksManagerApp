//
//  TaskFormPresenter.swift
//  TasksManagerApp
//
//  Created by maxim on 14.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class TaskFormPresenter {
    
    // MARK: - Dependency
    
    weak var viewInput: (UIViewController & TaskFormViewInput)?

    // MARK: - Private properties
    
    private let dbManager: DataBaseManagerProtocol
    internal var task: Task?
    
    // MARK: - Init
    
    required init(dataBase: DataBaseManagerProtocol, task: Task?) {
        self.dbManager = dataBase
        self.task = task
    }

}

// MARK: - TaskFormViewInput

extension TaskFormPresenter: TaskFormViewOutput {
    
    func didAppear() {
        viewInput?.setData(task: self.task)
    }
    
    func didCraft(data: TaskModel) {
        if let error = dbManager.add(task: data) {
            viewInput?.show(message: error.localizedDescription)
        } else {
            viewInput?.close(message: "Saved!")
        }
    }
    
    func didEdit(data: TaskModel) {
        guard let task = self.task else { return }
        task.setData(from: data)
        if let error = dbManager.save(task: task) {
            viewInput?.show(message: error.localizedDescription)
        } else {
            viewInput?.close(message: "Saved!")
        }
    }
    
}
