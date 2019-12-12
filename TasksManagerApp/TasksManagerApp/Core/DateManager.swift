//
//  DateManager.swift
//  BloodPressureDiary
//
//  Created by maxim on 27.11.2019.
//  Copyright © 2019 lifeasplay. All rights reserved.
//

import Foundation

enum DateFormats: String {
    // Sep 29
    case MMMd = "MMM d"
    // 22:04
    case hhmm = "hh:mm"
}

/**
 Работает с типом Date.
 Умеет:
 - возвращать дату в виде строки в выбраном формате.
 - возвращает дату изменённую на количество дней.
 - делает проверку является ли дата сегодняшней.
 */
struct DateManager {
    
    // MARK: - Constants
    
    private let formatter = DateFormatter()
    private let calendar = Calendar.current
    
    // MARK: - Puplic methods
    
    /// Возвращает строку из даты.
    /// - Parameters:
    ///   - date: Дата.
    ///   - format: Вариант формата.
    func getString(from date: Date, with format: DateFormats) -> String {
        formatter.dateFormat = format.rawValue
        return formatter.string(from: date)
    }
    
    /// Возвращает дату увеличенную на количество дней.
    /// - Parameters:
    ///   - date: Текущая дата.
    ///   - days: Количество дней.
    func date(from date: Date, plus days: Int) -> Date? {
        return calendar.date(byAdding: .day, value: days, to: date)
    }
    
    /// Вычисляет является ли указанная дата сегодня.
    /// - Parameter date: Дата.
    func isToday(date: Date) -> Bool {
        let currentDay = calendar.component(.day, from: Date())
        let examineDay = calendar.component(.day, from: date)
        return examineDay == currentDay
    }
   
}
