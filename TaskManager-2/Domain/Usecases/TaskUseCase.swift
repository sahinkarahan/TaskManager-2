//
//  TaskUseCase.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import Foundation

protocol TaskUseCaseProtocal {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTasks(of date: Date) -> [Task]
}

final class TaskUseCase {
    private let taskRepository: TaskRepositoryProtocal
    
    init(taskRepository: TaskRepositoryProtocal) {
        self.taskRepository = taskRepository
    }
}

extension TaskUseCase: TaskUseCaseProtocal {
    func getTaskList() -> [Task] {
        taskRepository.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskRepository.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskRepository.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) -> [Task] {
        taskRepository.deleteTask(task: task)
    }
    
    func getCurrentSelectedDateTasks(of date: Date) -> [Task] {
        return taskRepository.getCurrentSelectedDateTasks(of: date)
    }
    
    
}
