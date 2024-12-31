//
//  TaskRepository.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import Foundation

protocol TaskRepositoryProtocal {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTasks(of date: Date) -> [Task]
}

class TaskRepository {
    private let taskDataProvider: TaskDataProviderProtocal
    
    init(taskDataProvider: TaskDataProviderProtocal) {
        self.taskDataProvider = taskDataProvider
    }
}

extension TaskRepository: TaskRepositoryProtocal {
    func getTaskList() -> [Task] {
        taskDataProvider.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskDataProvider.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskDataProvider.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) -> [Task] {
        taskDataProvider.deleteTask(task: task)
    }
    
    func getCurrentSelectedDateTasks(of date: Date) -> [Task] {
        taskDataProvider.getCurrentSelectedDateTasks(of: date)
    }
    
    
}
