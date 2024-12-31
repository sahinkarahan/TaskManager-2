//
//  TasksHomePageViewModel.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import Foundation

struct TasksHomePageConstants {
    
}

enum SliderTimeDirection {
    case future
    case past
    case unknown
}

protocol TasksHomePageViewModelInput {
    func selectTheDay(with date: Date)
    func onDateScrolled(to direction: SliderTimeDirection)
    
    func updateTaskList(task: Task)
    func toggleTaskCompletion(task: Task)
    func deleteTask(task: Task)
    
}

protocol TasksHomePageViewModelOutput {
    func getSelectedDate() -> Date
    func getCurrentSelectedDateTasks() -> [Task]
}

protocol TasksHomePageViewModelProtocal: ObservableObject, TasksHomePageViewModelInput, TasksHomePageViewModelOutput {
    
}

class TasksHomePageViewModel: TasksHomePageViewModelProtocal {
    private let dateUseCase: DateUseCaseProtocal
    private let taskUseCase: TaskUseCaseProtocal
    
    @Published var items: [Task] = []
    @Published var weeks: [WeekModel] = []
    @Published var selectedDate: Date {
        didSet { calculatePastAndFutureWeeks(with: selectedDate) }
    }
    
    init(dateUseCase: DateUseCaseProtocal, taskUseCase: TaskUseCaseProtocal, with date: Date = Date()) {
        self.dateUseCase = dateUseCase
        self.taskUseCase = taskUseCase
        self.selectedDate = Calendar.current.startOfDay(for: date)
        calculatePastAndFutureWeeks(with: selectedDate)
        self.items = taskUseCase.getTaskList()
    }
    
    private func calculatePastAndFutureWeeks(with date: Date) {
        weeks = dateUseCase.calculatePastAndFutureWeeks(from: date)
    }
}


// MARK: - Input Protocol Implementation
extension TasksHomePageViewModel {
    
    func selectTheDay(with date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
    }
    
    func onDateScrolled(to direction: SliderTimeDirection) {
        
        switch direction {
        case .future:
            selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: selectedDate)!
            
        case .past:
            selectedDate = Calendar.current.date(byAdding: .day, value: -7, to: selectedDate)!
            
        case .unknown:
            selectedDate = selectedDate
        }
        
        calculatePastAndFutureWeeks(with: selectedDate)
    }
    
    func updateTaskList(task: Task) {
        items = taskUseCase.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) {
        items = taskUseCase.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) {
        items = taskUseCase.deleteTask(task: task)
    }
}

// MARK: - Output Protocol Implementation
extension TasksHomePageViewModel {
    
    func getSelectedDate() -> Date {
        selectedDate
    }
    
    func getCurrentSelectedDateTasks() -> [Task] {
        taskUseCase.getCurrentSelectedDateTasks(of: selectedDate)
    }
}
