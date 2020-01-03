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

    // MARK: - Constants

    private let dateManager = DateManager()
    
    // MARK: - Public properties
    
    var dateFrom: Date = Date() {
        willSet {
            if newValue > dateTo { dateTo = newValue }
            let dateString = dateManager.getString(from: newValue, with: .MMMd)
            viewInput?.dateFromLabel.text = dateString
        }
    }
    var dateTo: Date = Date() {
        didSet {
            let dateString = dateManager.getString(from: dateTo, with: .MMMd)
            viewInput?.dateToLabel.text = dateString
        }
    }
    var title: String = "" {
        didSet {
            viewInput?.tfTitle.text = title
        }
    }
    var description = "" {
        didSet {
            viewInput?.tfDescription.text = title
        }
    }
    var project: Project? {
        didSet {
            viewInput?.projectLabel.text = project?.title
        }
    }
    var color: String? {
        didSet {
            guard let newValue = color else { return }
            let newColor = UIColor(hexString: newValue)
            viewInput?.colorLabel.textColor = newColor
        }
    }

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
        viewInput?.projectLabel.text = project == nil ? "project" : project?.title
    }
    
    func didCraft(data: TaskModel) {
        if let error = dbManager.add(task: data) {
            viewInput?.show(message: error.localizedDescription)
        } else {
            viewInput?.close(message: "Saved!")
        }
    }
    
    func didEdit(data: TaskModel) {
//        guard let task = self.task else { return }
//        task.setData(from: data)
//        if let error = dbManager.save() {
//            viewInput?.show(message: error.localizedDescription)
//        } else {
//            viewInput?.close(message: "Saved!")
//        }
    }
}
