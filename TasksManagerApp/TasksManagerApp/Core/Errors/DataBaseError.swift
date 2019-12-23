//
//  DataBaseError.swift
//  TasksManagerApp
//
//  Created by maxim on 22.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

/// Ошибки базы данных
enum DataBaseError: Error {
    
    case objectWasNotFound
    
}

extension DataBaseError {
    
    var description: String {
        switch self {
        case .objectWasNotFound:
            return "Объект с таким id в базе не найден!"
        }
    }
    
}
