//
//  TaskManager_2App.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import SwiftUI

@main
struct TaskManager_2App: App {
    
    @StateObject var taskslistManager: TasksListManager = TasksListManager()
    
    var body: some Scene {
        WindowGroup {
            TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDateProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))

        }
    }
}
