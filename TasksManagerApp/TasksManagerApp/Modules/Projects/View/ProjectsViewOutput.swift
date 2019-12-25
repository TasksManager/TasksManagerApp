//
//  ProjectsViewOutput.swift
//  TasksManagerApp
//
//  Created by Mikhail Semerikov on 15.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

protocol ProjectsViewOutput {
    func getCountProjects() -> Int
    func getProjectTitle(index: Int) -> String
    func deleteProject(index: Int)
    func getDate() -> String
    func getProject(index: Int) -> Project?
    func getProjects()
    func getFilteredProject(request: String)
}
