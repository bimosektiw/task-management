//
//  TaskList.swift
//  Task Management
//
//  Created by Rahman Fadhil on 09/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import Foundation

class TaskList {
    static let shared = TaskList()
    
    private var _tasks = [
        Task(title: "Lorem1", duration: 5, completed: false, category: .pentingMendesak),
        Task(title: "Lorem2", duration: 5, completed: false, category: .pentingMendesak),
        Task(title: "Lorem3", duration: 5, completed: false, category: .tidakPentingMendesak),
        Task(title: "Lorem4", duration: 5, completed: false, category: .tidakPentingMendesak),
        Task(title: "Lorem5", duration: 5, completed: false, category: .pentingTidakMendesak),
        Task(title: "Lorem6", duration: 5, completed: false, category: .pentingTidakMendesak),
        Task(title: "Lorem7", duration: 5, completed: false, category: .tidakPentingTidakMendesak),
        Task(title: "Lorem8", duration: 5, completed: false, category: .tidakPentingTidakMendesak)
    ]
    
    func insert(title: String, duration: Int, category: Task.TaskCategory) {
        let task = Task(title: title, duration: duration, completed: false, category: category)
        _tasks.append(task)
    }
    
    func getTasksForCategoryNumber(_ categoryNumber: Int) -> [Task] {
        if categoryNumber > 4 {
            return [Task]()
        } else {
            return _tasks.filter { $0.category.rawValue == categoryNumber }
        }
    }
}
