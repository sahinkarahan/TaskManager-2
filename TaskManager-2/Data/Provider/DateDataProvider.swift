//
//  DateDataProvider.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import Foundation

protocol DateDataProviderProtocal {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateDataProvider {
    
    private func week(for date: Date, with index: Int) -> WeekModel {
        var result: [Date] = .init()
        guard let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)) else {
            return .init(index: index, dates: [], referenceDate: date) }
        
        (0...6).forEach { day in
            if let weekday = Calendar.current.date(byAdding: .day, value: day, to: startOfWeek) {
                result.append(weekday)
            }
        }
        return .init(index: index, dates: result, referenceDate: date)
    }
    
}

extension DateDataProvider: DateDataProviderProtocal {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        return [
            week(for: Calendar.current.date(byAdding: .day, value: -7, to: date)!, with: -1),
            week(for: date, with: 0),
            week(for: Calendar.current.date(byAdding: .day, value: 7, to: date)!, with: 1)
        ]
        
    }
}
