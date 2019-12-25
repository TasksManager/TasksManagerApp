//
//  PredicateManager.swift
//  TasksManagerApp
//
//  Created by maxim on 26.11.2019.
//  Copyright © 2019 lifeasplay. All rights reserved.
//
import Foundation

enum Period: String {
    case week = "-7"
    case twoWeek = "-14"
    case month = "-30"
}

struct PredicateFactory {

    // MARK: - Constants
    
    let dataManager = DateManager()
    let periodFormat = "(date >= %@) AND (date <= %@)"
    let idFormat = "%K == %@"

    // MARK: - Puplic methods
    
    /// Возвращает предикат за период.
    /// - Parameters:
    ///   - endDay: Текущая дата.
    ///   - period: Дни периода.
    func predicate(endDay: Date, period: Period) -> NSPredicate? {
        
        guard let days = Int(period.rawValue),
              let startDay = dataManager.date(from: endDay, plus: days) else {
            assertionFailure()
            return nil
        }
        return NSPredicate(format: periodFormat, startDay as NSDate, endDay as NSDate)
    }
    
    /// Возвращает предикат за кастомный период.
    /// - Parameters:
    ///   - endDay: Конечная дата.
    ///   - startDay: Начальная дата.
    func predicate(endDay: Date, startDay: Date) -> NSPredicate {
        return NSPredicate(format: periodFormat, startDay as NSDate, endDay as NSDate)
    }
    
    /// Возвращает предикат для id.
    /// - Parameter id: идентификатор объекта.
    func predicate(id: UUID) -> NSPredicate {
        return NSPredicate(format: "%K == %@", "id", id as CVarArg)
    }
    
}
