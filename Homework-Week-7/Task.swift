//
//  Constants.swift
//  Week8
//
//  Created by Raiymbek Azharbayev on 31.10.2023.
//

import UIKit

struct Task {
    var title: String
    var done: Int = 0
    var total: Int = 0
    var description: String
    var icon: (UIColor, String)
    var status: Status
    var subtasks: [Subtask]
    
    enum Status {
        case todo, completed, canceled
    }
    
    init(title: String, icon: (UIColor, String) = (.cyanCustom, "questionmark.circle.fill"),
        status: Status = .todo, subtasks: [Subtask]) {
        self.title = title
        self.done = subtasks.filter{ $0.isCompleted }.count
        self.total = subtasks.count
        self.description = "\(done) of \(total) task" + ((total == 1) ? " completed" : "s completed")
        self.icon = icon
        self.status = (done == total) ? .completed : status
        self.subtasks = subtasks
        
        switch self.status {
            case .completed:
                self.icon = (.complete, "checkmark")
            case .canceled:
                self.icon = (.cancel, "xmark")
            default:
                self.subtasks.insert(Subtask(title: "Add a list item", isCompleted: false), at: 0)
        }
    }
}

struct Subtask {
    var title: String
    var isCompleted: Bool
}
