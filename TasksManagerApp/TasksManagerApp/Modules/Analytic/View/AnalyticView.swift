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
    
    let presenter: AnalyticViewOutput

    // MARK: - Private properties
    
    let addTaskButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Task", for: .normal)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    init(presenter: AnalyticViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configure()
    }

    // MARK: - Private methods
    
    private func configure() {
        view.addSubview(addTaskButton)
        
        NSLayoutConstraint.activate([
            addTaskButton.widthAnchor.constraint(equalToConstant: 100.0),
            addTaskButton.heightAnchor.constraint(equalToConstant: 60),
            addTaskButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func tapped() {
        onTaskForm?()
    }

    // MARK: - Navigation
    
    var onTaskForm: (() -> Void)?
}

// MARK: - AnaliticViewInput

extension AnalyticView: AnalyticViewInput {}
