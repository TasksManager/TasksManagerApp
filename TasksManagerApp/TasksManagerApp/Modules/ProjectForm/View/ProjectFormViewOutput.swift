//
//  ProjectsFormViewOutput.swift
//  TasksManagerApp
//
//  Created by Mikhail Semerikov on 18.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

protocol ProjectFormViewOutput: AnyObject {
    func addProject(title: String, color: String)
    func didAppear()
    func didCraft(data: ProjectModel)
    func didEdit(data: ProjectModel)
}
