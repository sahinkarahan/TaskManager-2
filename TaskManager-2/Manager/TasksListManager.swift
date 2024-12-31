//
//  TasksListManager.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import Foundation

class TasksListManager: ObservableObject {
    @Published var items: [Task] = []
    
    init() {
        self.items = getTaskList()
    }
    
    private func refreshTaskList() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: "notes")
    }
    
    func getTaskList() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        if let json = try? JSONDecoder().decode([Task].self, from: data) {
            items = json
            return items
        }
        return []
    }
    
    func updateTaskList(task: Task) {
        items.append(task)
        refreshTaskList()
    }
    
    func deleteTask(task: Task) {
        let index = items.firstIndex(of: task) ?? 0
        items.remove(at: index)
        refreshTaskList()
    }
    
    func toggleTaskCompletion(task: Task) {
        let index = items.firstIndex(of: task) ?? 0
        items[index].isCompleted.toggle()
        refreshTaskList()
    }
    
    
    
    
}
