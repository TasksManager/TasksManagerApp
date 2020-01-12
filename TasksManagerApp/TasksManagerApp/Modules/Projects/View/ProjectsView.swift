//
//  ProjectsView.swift
//  TasksManagerApp
//
//  Created by maxim on 09.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class ProjectsView: UIViewController {
    
    // MARK: - Dependency
    private let viewOutput: ProjectsViewOutput
    
    // MARK: - Constants
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    private let topView = UIView()
    private let tableView = UITableView(frame: CGRect.zero, style: .plain)
    private let topViewLabel = UILabel()
    private let addButton = UIButton()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBar = UISearchBar()
    
    private let topViewHeight: CGFloat = 30
    private let searchBarHeight: CGFloat = 50
    
    // MARK: - Init
    init(_ presenter: ProjectsViewOutput) {
        self.viewOutput = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tmaColor
        searchBar = searchController.searchBar
        setupTopView()
        setupSearchBar()
        setupTableView()
        setupTopViewLabel()
        setupAddButton()
        viewOutput.getProjects()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewOutput.getProjects()
        tableView.reloadData()
    }
    
    // MARK: - Puplic methods
    // MARK: - Private methods
    private func setupTopView() {
        view.addSubview(topView)
        topView.backgroundColor = .tmaColor
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = topView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let widthConstraint = topView.widthAnchor.constraint(equalToConstant: width)
        let heightConstraint = topView.heightAnchor.constraint(equalToConstant: topViewHeight)
        view.addConstraints([topConstraint, leadingConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupTopViewLabel() {
        topViewLabel.font = .systemFontOfSize(size: 26)
        topViewLabel.textColor = .tmaWhiteColor
        topViewLabel.text = viewOutput.getDate()
        topViewLabel.textAlignment = .center
        topViewLabel.numberOfLines = 1
        topView.addSubview(topViewLabel)
        
        topViewLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = topViewLabel.topAnchor.constraint(equalTo: topView.topAnchor)
        let horizontalConstraint = topViewLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor)
        let widthConstraint = topViewLabel.widthAnchor.constraint(equalToConstant: width - 120)
        let heightConstraint = topViewLabel.heightAnchor.constraint(equalToConstant: topViewHeight)
        topView.addConstraints([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupAddButton() {
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.titleLabel?.font = .systemFontOfSize(size: 26)
        addButton.titleLabel?.textColor = .tmaWhiteColor
        addButton.setTitle("+", for: .normal)
        topView.addSubview(addButton)
        
        addButton.isAccessibilityElement = true
        addButton.accessibilityIdentifier = "addProjectButton"
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = addButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15)
        let verticalConstraint = addButton.topAnchor.constraint(equalTo: topView.topAnchor)
        let widthConstraint = addButton.widthAnchor.constraint(equalToConstant: topViewHeight)
        let heightConstraint = addButton.heightAnchor.constraint(equalToConstant: topViewHeight)
        topView.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type something here to search"
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(ProjectsViewCell.self, forCellReuseIdentifier: "ProjectsViewCell")
        tableView.backgroundColor = .tmaWhiteColor
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = searchController.searchBar
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableViewHeight = height - topViewHeight - searchBarHeight
        let topConstraint = tableView.topAnchor.constraint(equalTo: topView.bottomAnchor)
        let leadingConstraint = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let widthConstraint = tableView.widthAnchor.constraint(equalToConstant: width)
        let heightConstraint = tableView.heightAnchor.constraint(equalToConstant: tableViewHeight)
        view.addConstraints([topConstraint, leadingConstraint, widthConstraint, heightConstraint])
    }
    
    // MARK: - IBActions
    @objc private func addButtonPressed() {
        onProjectForm?(nil)
    }
    // MARK: - Buttons methods
    // MARK: - Navigation
    var onProjectForm: ((Project?) -> Void)?

}

extension ProjectsView: UITableViewDelegate {}

extension ProjectsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewOutput.getCountProjects()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectsViewCell",
                                                       for: indexPath) as? ProjectsViewCell
            else { return UITableViewCell() }

        cell.configure(viewOutput.getProjectTitle(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { _, _, completionHandler in
            self.viewOutput.deleteProject(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, completionHandler in
            self.onProjectForm?(self.viewOutput.getProject(index: indexPath.row))
            completionHandler(true)
        }

        delete.backgroundColor = .red
        edit.backgroundColor = .orange

        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        config.performsFirstActionWithFullSwipe = false
        return config
    }

}

extension ProjectsView: ProjectsViewInput {}

extension ProjectsView: UISearchBarDelegate {}

extension ProjectsView: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text == "" {
            viewOutput.getProjects()
            tableView.reloadData()
        } else {
            viewOutput.getFilteredProject(request: text)
            tableView.reloadData()
        }
    }
    
}
