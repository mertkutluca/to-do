//
//  ToDoListPresentation.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

struct ToDoListPresentation: Equatable {
    let title: String
    let detail: String
    let dueDate: Date
    let state: ToDoState
    
    static func ==(lhs: ToDoListPresentation, rhs: ToDoListPresentation) -> Bool {
        return lhs.title == rhs.title && lhs.detail == rhs.detail && lhs.dueDate == rhs.dueDate && lhs.state == rhs.state
    }
}
