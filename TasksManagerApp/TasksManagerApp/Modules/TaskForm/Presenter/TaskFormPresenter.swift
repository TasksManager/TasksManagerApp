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
    // MARK: - Public properties
    // MARK: - Private properties
    
    internal var task: Task?

    
    // MARK: - Init
    
    required init(_ task: Task?) {
        self.task = task
    }
    
    // MARK: - Lifecycle ViewController
    // MARK: - Public methods
    // MARK: - Private methods
    // MARK: - IBActions
    // MARK: - Buttons methods
    // MARK: - Navigation

}

// MARK: - TaskFormViewOutput

extension TaskFormPresenter: TaskFormViewOutput {
    
    func didCraft(data: TaskModel) {
        
    }
    
    func didEdit(task: TaskModel) {
        
    }
    
    
}
