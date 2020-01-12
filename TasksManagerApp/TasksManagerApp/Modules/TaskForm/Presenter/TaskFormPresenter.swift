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
    var description: String? {
        didSet {
            viewInput?.tfDescription.text = description
        }
    }
    var project: Project? {
        didSet {
            viewInput?.projectLabel.text = project == nil ? "project" : project?.title
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
    
    // MARK: - Private methods
    
    // Setup value to form.
    private func setupFormValues() {
        guard let task = task else { return }
        self.dateFrom = task.dateFrom
        self.dateTo = task.dateTo
        self.title = task.title
        self.description = task.body
        self.project = task.project
    }
    
    private func validate(_ model: TaskModel) -> Bool {
        var taskModel = model
        guard taskModel.isValid else {
            for brokenRule in taskModel.brokenRules {
                print(brokenRule.message)
            }
            return false
        }
        return true
    }

}

// MARK: - TaskFormViewInput

extension TaskFormPresenter: TaskFormViewOutput {
    func didLoad() {
        setupFormValues()
    }
    
    func save() {
        let dates = Dates(dateFrom, dateTo)
        let model = TaskModel(
            id: task?.id ?? UUID(),
            dates: dates,
            title: title,
            body: description,
            isComplete: false,
            project: project)
        guard validate(model) else {
            return
        }

        if let error = task == nil ? dbManager.add(task: model) : dbManager.save(task: model) {
            viewInput?.show(message: error.localizedDescription)
        } else {
            viewInput?.close(message: "Saved!")
        }
    }
}
