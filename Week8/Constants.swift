//
//  Constants.swift
//  Week8
//
//  Created by Raiymbek Azharbayev on 31.10.2023.
//

import UIKit

extension UIColor {
    static let purpleCustom = UIColor(red: 0.48, green: 0.30, blue: 0.97, alpha: 1),
               pinkCustom = UIColor(red: 0.92, green: 0.30, blue: 0.76, alpha: 1),
               greenCustom = UIColor(red: 0.77, green: 0.84, blue: 0.32, alpha: 1),
               orangeCustom = UIColor(red: 0.94, green: 0.70, blue: 0.31, alpha: 1),
               blueCustom = UIColor(red: 0.29, green: 0.63, blue: 0.87, alpha: 1),
               redCustom = UIColor(red: 0.74, green: 0.19, blue: 0.17, alpha: 1),
               cyanCustom = UIColor(red: 0.38, green: 0.82, blue: 0.98, alpha: 1),
               yellowCustom = UIColor(red: 0.95, green: 0.73, blue: 0.35, alpha: 1),
               complete = UIColor(red: 0.61, green: 0.90, blue: 0.43, alpha: 1),
               cancel = UIColor(red: 0.92, green: 0.28, blue: 0.33, alpha: 1),
               grayCustom = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1),
               lightGrayCustom = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
}

struct Constants {
    static let sections = ["to do", "completed", "canceled"]
    
    static var tasks = [
        Task(
            title: "Clean the garage",
            icon: (.purpleCustom, "door.garage.closed"),
            subtasks: [
                Subtask(title: "Organize tools", isCompleted: false),
                Subtask(title: "Sweep the floor", isCompleted: true),
                Subtask(title: "Dispose of old items", isCompleted: true)
            ]
        ),
        Task(
            title: "Call grandma",
            icon: (.pinkCustom, "phone.badge.waveform.fill"),
            subtasks: [
                Subtask(title: "Make a phone call", isCompleted: false)
            ]
        ),
        Task(
            title: "Pay bills",
            icon: (.greenCustom, "arrow.down.left.circle"),
            subtasks: [
                Subtask(title: "Electricity bill", isCompleted: false),
                Subtask(title: "Water bill", isCompleted: false),
                Subtask(title: "Internet bill", isCompleted: true)
            ]
        ),
        Task(
            title: "Water the plants",
            icon: (.orangeCustom, "leaf.fill"),
            subtasks: [
                Subtask(title: "Indoor plants", isCompleted: false),
                Subtask(title: "Outdoor plants", isCompleted: true)
            ]
        ),
        Task(
            title: "Go shopping",
            icon: (.blueCustom, "cart.fill"),
            subtasks: [
                Subtask(title: "Groceries", isCompleted: false),
                Subtask(title: "Household items", isCompleted: false)
            ]
        ),
        Task(
            title: "Practice piano",
            icon: (.redCustom, "pianokeys.inverse"),
            subtasks: [
                Subtask(title: "Scales", isCompleted: false),
                Subtask(title: "Melodies", isCompleted: false),
                Subtask(title: "Chords", isCompleted: true)
            ]
        ),
        Task(
            title: "Check the weather",
            icon: (.cyanCustom, "cloud.drizzle.fill"),
            subtasks: [
                Subtask(title: "Today's forecast", isCompleted: false)
            ]
        ),
        Task(
            title: "Play video games",
            icon: (.yellowCustom, "gamecontroller.fill"),
            subtasks: [
                Subtask(title: "Adventure mode", isCompleted: false),
                Subtask(title: "Multiplayer mode", isCompleted: false)
            ]
        ),
        Task(
            title: "Pack for the trip",
            icon: (.orangeCustom, "suitcase.rolling.fill"),
            subtasks: [
                Subtask(title: "Clothing", isCompleted: false),
                Subtask(title: "Toiletries", isCompleted: false),
                Subtask(title: "Travel documents", isCompleted: true)
            ]
        ),
        Task(
            title: "Repair the bike",
            icon: (.redCustom, "bicycle"),
            subtasks: [
                Subtask(title: "Inflate tires", isCompleted: false),
                Subtask(title: "Oil the chain", isCompleted: false)
            ]
        ),
        Task(
            title: "Exercise",
            icon: (.pinkCustom, "figure.strengthtraining.functional"),
            subtasks: [
                Subtask(title: "Cardio workout", isCompleted: false),
                Subtask(title: "Strength training", isCompleted: true)
            ]
        ),
        Task(
            title: "Finish the report",
            subtasks: [
                Subtask(title: "Gather data", isCompleted: true),
                Subtask(title: "Write summary", isCompleted: true),
                Subtask(title: "Create graphs", isCompleted: true)
            ]
        ),
        Task(
            title: "Car maintenance",
            subtasks: [
                Subtask(title: "Change oil", isCompleted: true),
                Subtask(title: "Rotate tires", isCompleted: true),
                Subtask(title: "Check brakes", isCompleted: true)
            ]
        ),
        Task(
            title: "Send emails",
            subtasks: [
                Subtask(title: "Compose messages", isCompleted: true),
                Subtask(title: "Attach files", isCompleted: true),
                Subtask(title: "Click send", isCompleted: true)
            ]
        ),
        Task(
            title: "Fix the light",
            subtasks: [
                Subtask(title: "Replace bulb", isCompleted: true)
            ]
        ),
        Task(
            title: "Add new contacts",
            subtasks: [
                Subtask(title: "Collect contact info", isCompleted: true),
                Subtask(title: "Create contact entries", isCompleted: true)
            ]
        ),
        Task(
            title: "Plan the week",
            subtasks: [
                Subtask(title: "Schedule meetings", isCompleted: true),
                Subtask(title: "Set goals", isCompleted: true),
                Subtask(title: "Prepare tasks", isCompleted: true),
                Subtask(title: "Review appointments", isCompleted: true),
                Subtask(title: "Create to-do list", isCompleted: true),
                Subtask(title: "Set priorities", isCompleted: true),
                Subtask(title: "Check deadlines", isCompleted: true)
            ]
        ),
        Task(
            title: "Cancel subscription",
            status: .canceled,
            subtasks: [
                Subtask(title: "Contact customer support", isCompleted: false)
            ]
        ),
        Task(
            title: "Rate the app",
            status: .canceled,
            subtasks: [
                Subtask(title: "Write a review", isCompleted: false)
            ]
        ),
        Task(
            title: "Clean the attic",
            status: .canceled,
            subtasks: [
                Subtask(title: "Sort items", isCompleted: false)
            ]
        )
    ]
    
    static func getTotalCount() -> Int {
        tasks.count
    }
    
    static func getToDoCount() -> Int {
        tasks.filter{ $0.status == .todo }.count
    }
    
    static func getCompletedCount() -> Int {
        tasks.filter{ $0.status == .completed }.count
    }
    
    static func getCanceledCount() -> Int {
        tasks.filter{ $0.status == .canceled }.count
    }
}

enum Status {
    case todo, completed, canceled
}

struct Task {
    var title: String
    var done: Int = 0
    var total: Int = 0
    var description: String
    var icon: (UIColor, String)
    var status: Status
    var subtasks: [Subtask]
    
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
