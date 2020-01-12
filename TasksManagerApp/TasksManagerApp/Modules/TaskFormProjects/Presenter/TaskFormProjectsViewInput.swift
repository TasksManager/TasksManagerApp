//
//  TaskFormProjectsViewInput.swift
//  TasksManagerApp
//
//  Created by maxim on 30.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

protocol TaskFormProjectsViewInput: AnyObject {
    
    var projects: [Project] { get set }
}
