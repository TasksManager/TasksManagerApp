//
//  AppDelegate.swift
//  TasksManagerApp
//
//  Created by maxim on 07.12.2019.
//  Copyright © 2019 maxim. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coordinator: AppCoordinator?
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        checkDataBase()
       
        coordinator = AppCoordinator(self.window ?? UIWindow())
        coordinator?.start()
        
        return true
    }
    
    // swiftlint:disable all
    // FIXME: - Убрать! Оставил для теста базы данных.
    
    let predicateFactory = PredicateFactory()
    
    func checkDataBase() {
        // позже сохраним сюда id
        var taskID: UUID = UUID()
        var projectID: UUID = UUID()
        
        // создаём модель задачи
        let taskModel = TaskModel(
            id: UUID(),
            dates: Dates(Date(), Date()),
            title: "test"
        )
        
        // создаём экземпляр базы данных
        let dbManager = DataBaseManager.instance
        // добавляем задачу в базу
        _ = dbManager.add(task: taskModel)
        // создаем предикат все варианты)
        let predicate = NSPredicate(value: true)
        // запрос возвращает тип: Result<[Task], Error>
        let taskFetchResult = dbManager.fetch(tasks: predicate)
         
        print(taskFetchResult)
         
        // так можно из Array получить Set
        // swiftlint:disable force_try
        let arrayTasks = try! taskFetchResult.get()
        let setTasks = Set(arrayTasks.map { $0 })
        // модель проекта. свойство tasks имеет тип Set<Task> (так хочет Core Data)
        let projectModel = ProjectModel(id: UUID(), title: "test", color: nil, tasks: setTasks)
        // добавляем проект в базу
        _ = dbManager.add(project: projectModel)
        // получаем все проекты
        let projectsFetchResult = dbManager.fetch(projects: predicate)
        
        print(projectsFetchResult)
    
        // изменяем задачу
        do {
            // достаём задачу
            let tasks = try taskFetchResult.get()
            guard let task = tasks.first else {
                print("Запрос задачь вернул пустой массив!")
                return
            }
            // cохраним id задачи
            taskID = task.id
            // создаём модель из задачи
            var changedTaskModel = TaskModel(task: task)
            // проводим изменения
            changedTaskModel.title = "Changed title"
            // валидируем
            guard changedTaskModel.isValid else {
                changedTaskModel.brokenRules.forEach { print($0) }
                return
            }
            // сохраняем в базу
            print("Save to base error is: \(String(describing: dbManager.save(task: changedTaskModel)))")
        } catch let error {
            print(error)
        }
        // проверяем приминились ли изменения
        let predicateTaskId = predicateFactory.predicate(id: taskID)
        let taskFetchIdResult = dbManager.fetch(tasks: predicateTaskId)
        do {
            let tasks = try taskFetchIdResult.get()
            guard let task = tasks.first else {
                print("Запрос вернул пустой массив!")
                return
            }
            print("Task's new title is: \(task.title)")
        } catch let error {
            print(error)
        }
        
        // тоже самое с проектом
        do {
            let projects = try projectsFetchResult.get()
            guard let project = projects.first else {
                print("Запрос проектов вернул пустой массив!")
                return
            }
            projectID = project.id
            var changedProjectModel = ProjectModel(project: project)
            changedProjectModel.title = "Changed project title"
            // валидируем
            guard changedProjectModel.isValid else {
                changedProjectModel.brokenRules.forEach { print($0) }
                return
            }            
            print("Save to base error is: \(String(describing: dbManager.save(project: changedProjectModel)))")
        } catch let error {
            print(error)
        }
        
        var changedProject: Project?
        
        // проверяем приминились ли изменения
        let predicateProjectId = predicateFactory.predicate(id: projectID)
        let projectFetchIdResult = dbManager.fetch(projects: predicateProjectId)
        do {
            let projects = try projectFetchIdResult.get()
            guard let project = projects.first else {
                print("Запрос проекта по id вернул пустой массив!")
                return
            }
            changedProject = project
            print("Task's new title is: \(project.title)")
        } catch let error {
            print(error)
        }
        
        // полчаем задачи у проекта
        let tasks = changedProject?.tasks as? Set<Task>
        // получаем проект у задачи
        guard let firstTask = tasks?.first else {
            print("У проекта нет задач")
            return
        }
        print("Задача проект: \(firstTask)")
        // удаляем проект
        print("Result project delete is: \(String(describing: dbManager.delete(project: projectID)))")
        // проверяем удалились ли задачи проекта?
        let projectTasks = changedProject?.tasks as? Set<Task>
        guard projectTasks?.first != nil else {
            print("У проекта нет задач")
            return
        }        
        
    }
}
