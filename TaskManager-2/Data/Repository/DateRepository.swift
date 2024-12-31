//
//  DateRepository.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import Foundation

protocol DateRepositoryProtocal {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateRepository {
    private let dateDateProvider: DateDataProviderProtocal
    init(dateDateProvider: DateDataProviderProtocal) {
        self.dateDateProvider = dateDateProvider
    }
}

extension DateRepository: DateRepositoryProtocal {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        return dateDateProvider.calculatePastAndFutureWeeks(with: date)
    }
}
