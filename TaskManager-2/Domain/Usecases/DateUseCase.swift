//
//  DateUseCase.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import Foundation

protocol DateUseCaseProtocal {
    func calculatePastAndFutureWeeks(from date: Date) -> [WeekModel]
}

class DateUseCase {
    private let dateRepository: DateRepositoryProtocal
    
    init(dateRepository: DateRepositoryProtocal) {
        self.dateRepository = dateRepository
    }
}

extension DateUseCase: DateUseCaseProtocal {
    func calculatePastAndFutureWeeks(from date: Date) -> [WeekModel] {
      return dateRepository.calculatePastAndFutureWeeks(with: date)
    }
}
