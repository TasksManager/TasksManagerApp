//
//  ProjectsFormViewInput.swift
//  TasksManagerApp
//
//  Created by Mikhail Semerikov on 18.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

protocol ProjectFormViewInput: AnyObject {
    func setData(project: Project?)
    func show(message: String)
    func close(message: String?)
}
