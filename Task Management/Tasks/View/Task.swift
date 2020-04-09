//
//  Task.swift
//  Task Management
//
//  Created by Rahman Fadhil on 09/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import Foundation

struct Task {
    enum TaskCategory: Int {
        case pentingMendesak = 0
        case pentingTidakMendesak = 1
        case tidakPentingMendesak = 2
        case tidakPentingTidakMendesak = 3
    }
    
    let title: String
    let duration: Int
    let completed: Bool
    let category: TaskCategory
}
