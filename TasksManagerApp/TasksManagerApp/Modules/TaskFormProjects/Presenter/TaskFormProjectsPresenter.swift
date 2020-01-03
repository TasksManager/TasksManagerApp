//
//  TaskFormProjectsPresenter.swift
//  TasksManagerApp
//
//  Created by maxim on 30.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class TaskFormProjectsPresenter {
    
    // MARK: - Dependency
    
    weak var viewInput: (UITableViewController & TaskFormProjectsViewInput)?

    // MARK: - Private properties
    
    private let dataBase: DataBaseManagerProtocol
    
    // MARK: - Init
    
    init(dataBase: DataBaseManagerProtocol) {
        self.dataBase = dataBase
    }

}

extension TaskFormProjectsPresenter: TaskFormProjectsViewOutput {
    func didAppear() {
        let predicate = NSPredicate(value: true)
        let result = dataBase.fetch(projects: predicate)
        switch result {
        case .success(let projects):
            viewInput?.projects = projects
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
