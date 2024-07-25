//
//  TaskViewModel.swift
//  SwiftUI_Tasks
//
//  Created by Sun Asterisk Philippines on 7/25/24.
//

import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private let userDefaultsKey = "tasks"
    
    init() {
        loadTasks()
    }
    
    func addTask(title: String) {
        let newTask = Task(id: UUID(), title: title)
        tasks.append(newTask)
        saveTasks()
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = savedTasks
        }
    }
    
    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
}
