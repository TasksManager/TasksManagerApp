//
//  TaskFormView.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

/// Форма редактирования задачи.
class TaskFormView: UIViewController {
    
    // MARK: - Dependency
    
    // MARK: - Constants
    // MARK: - Public properties
    // MARK: - Private properties
    
    private let viewOutput: TaskFormViewOutput
    
    // MARK: - Init
    
    init(_ presenter: TaskFormViewOutput) {
        self.viewOutput = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Public methods
    // MARK: - Private methods
    // MARK: - IBActions
    // MARK: - Buttons methods
    // MARK: - Navigation



}

// MARK: - TaskFormViewInput

extension TaskFormView: TaskFormViewInput {
    
    func setData(task: Task?) {
        
    }
}
