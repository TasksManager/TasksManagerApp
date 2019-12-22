//
//  TasksView.swift
//  TasksManagerApp
//
//  Created by Oxana Lobysheva on 22/12/2019.
//  Copyright © 2019 TEAM (Lobysheva and Tolstikov and Semerikov). All rights reserved.
//

import UIKit

class TasksView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView = UITableView()
    var titleLabel: UILabel = UILabel()
    
    private var tasks : [TaskModel] = [
        TaskModel(id:  UUID(),
                  dates: Dates(Date(),Date()+10),
                  title: "Title 1 sdfsdfsdfsd sdfsdfsdf sdfsdfsdfsdf sdfsdfsdf sdfsdfsdfsdf sdfsdfsdfsdf dfsdfsdfsdf sdfsdfsdf sdfsdfsdf sdfdsfsdf",
                  body: "Body 1",
                  isComplete: false,
                  project: nil),
        TaskModel(id:  UUID(),
                  dates: Dates(Date()-2,Date()+11),
                  title: "Title 2",
                  body: "Body 2",
                  isComplete: false,
                  project: nil),
        TaskModel(id:  UUID(),
                  dates: Dates(Date()-3,Date()+12),
                  title: "Title 3",
                  body: "Body 3",
                  isComplete: false,
                  project: nil)
    ]
    private var projects : [String] = ["Project1", "Project2", "Project3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = TaskNavigationBar(
            frame: CGRect(x: 0,
                          y: 50,
                          width:  UIScreen.main.bounds.width,
                          height: 0)
         )
        
//        let navigationBar = UINavigationBar(
//            frame: CGRect(x: 0,
//                          y: 50,
//                          width:  UIScreen.main.bounds.width,
//                          height: 0
//        ))
//        navigationBar.backgroundColor = .tmaColor
//        let navigationItem = UINavigationItem(title: "TASKS - TODAY")
//        let addBtn = UIBarButtonItem(
//            barButtonSystemItem: UIBarButtonItem.SystemItem.add,
//            target: nil,
//            action: #selector(selectorX))
//        navigationItem.rightBarButtonItem = addBtn
//        navigationBar.setItems([navigationItem], animated: false)
        self.view.addSubview(navigationBar)
       
        
        
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView.frame = CGRect(x: 0, y: barHeight+50, width: displayWidth, height: displayHeight - barHeight)
        let contentSize = self.tableView.contentSize
        let footer = UIView(frame: CGRect(x: self.tableView.frame.origin.x,
                                          y: self.tableView.frame.origin.y + contentSize.height,
                                          width: self.tableView.frame.size.width,
                                          height: self.tableView.frame.height - self.tableView.contentSize.height))
        
        self.tableView.tableFooterView = footer
        view.addSubview(tableView)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath as IndexPath)
        myCell.textLabel?.text = tasks[indexPath.row].title
        
        titleLabel = TaskTitleLabel(
            frame: CGRect(origin: .zero,
                          size: CGSize(width: self.tableView.frame.size.width-20,
                                       height: 100)))
        titleLabel.text  = tasks[indexPath.row].title
        
        myCell.addSubview(titleLabel)
        
        return myCell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < projects.count {
            return projects[section]
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        showDialog(text: (currentCell.textLabel?.text)!)
    }
    
    func showDialog(text : String)
    {
        let alert = UIAlertController(title: "STUB for click", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}
