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
    
    // MARK: - Private properties
    
    private let viewOutput: TaskFormViewOutput
    
    private let saveButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    init(_ presenter: TaskFormViewOutput) {
        self.viewOutput = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewOutput.didAppear()
        view.backgroundColor = .red
        configure()
    }
    
    // MARK: - Private methods
    
    private func configure() {
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.widthAnchor.constraint(equalToConstant: 100.0),
            saveButton.heightAnchor.constraint(equalToConstant: 60),
            saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func tapped() {
        onBack?("Saved")
    }

    
    // MARK: - Navigation

    var onBack: ((String?) -> Void)?

}

// MARK: - TaskFormViewInput

extension TaskFormView: TaskFormViewInput {
    
    func setData(task: Task?) {
        // Здесь устанавливаем данные.
    }
    
    func show(message: String) {
        // Здесь показыаем алерт.
    }
    
    func close(message: String?) {
        onBack?(message)
    }

}
