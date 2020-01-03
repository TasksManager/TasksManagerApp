//
//  TaskFormProjectsView.swift
//  TasksManagerApp
//
//  Created by maxim on 30.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class TaskFormProjectsView: UITableViewController {
    
    // MARK: - Constants

    private let reuseIditifier = "reuseIdentifier"
    
    // MARK: - Public properties
    
    var projects: [Project] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Private properties
    
    private let viewOutput: TaskFormProjectsViewOutput
    
    // MARK: - Init
    
    init(_ presenter: TaskFormProjectsViewOutput) {
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
    }

    // MARK: - Private methods

    private func configure() {
        
    }
    
    // MARK: - Navigation

    var onBack: ((Project?) -> Void)?
    
}

// MARK: - TaskFormProjectsViewInput

extension TaskFormProjectsView: TaskFormProjectsViewInput {}

// MARK: - UITableViewDataSource

extension TaskFormProjectsView {
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIditifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseIditifier)
        }
        cell?.textLabel?.text = projects[indexPath.row].title
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension TaskFormProjectsView {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projects[indexPath.row]
        onBack?(project)
    }
}
