//
//  AnalyticView.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class AnalyticView: UIViewController {
    // MARK: - Dependency
    
    let presenter: AnaliticViewOutput
    
    // MARK: - Constants
    // MARK: - Public properties
    // MARK: - Private properties
    // MARK: - Init
    
    init(presenter: AnaliticViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FIXME: - Убрать!
        presenter.setBackground()
        
    }
    
    // MARK: - Puplic methods
    // MARK: - Private methods
    // MARK: - IBActions
    // MARK: - Buttons methods
    // MARK: - Navigation
}

// MARK: - AnaliticViewInput

extension AnalyticView: AnaliticViewInput {}
