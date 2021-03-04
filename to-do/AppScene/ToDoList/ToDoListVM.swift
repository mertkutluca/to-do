//
//  ToDoListVM.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

final class ToDoListVM: ToDoListVMProtocol {
    var delegate: ToDoListVMOutputDelegate?
    
    private let todos: [ToDoListPresentation] = [
        ToDoListPresentation(title: "title 1",
                             detail: "detail 1",
                             dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                             state: .active),
        ToDoListPresentation(title: "title 2",
                             detail: "detail 2",
                             dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                             state: .completed),
        ToDoListPresentation(title: "title 3",
                             detail: "detail 3",
                             dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                             state: .active),
        ToDoListPresentation(title: "title 4",
                             detail: "detail 4",
                             dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                             state: .completed),
        ToDoListPresentation(title: "title 5",
                             detail: "detail 5",
                             dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                             state: .active),
        ToDoListPresentation(title: "title 6",
                             detail: "detail 6",
                             dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                             state: .active),
        ToDoListPresentation(title: "title 7",
                             detail: "detail 7",
                             dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                             state: .completed),
        ToDoListPresentation(title: "title 8",
                             detail: "detail 8",
                             dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                             state: .active),
    ]
    
    private var expiredTodos: [ToDoListPresentation] = []
    private var activeTodos: [ToDoListPresentation] = []
    
    func load() {
        expiredTodos = todos.filter({ (todo) -> Bool in
            todo.state == .completed
        })
        
        activeTodos = todos.filter({ (todo) -> Bool in
            todo.state == .active
        })
    }
    
    func getNumberOfItem(for state: ToDoState) -> Int {
        switch state {
        case .completed:
            return expiredTodos.count
        case .active:
            return activeTodos.count
        }
    }
    
    func getItem(at: Int, for state: ToDoState) -> ToDoListPresentation {
        switch state {
        case .completed:
            return expiredTodos[at]
        case .active:
            return activeTodos[at]
        }
    }
    
    func addToDo(addingToDo: ToDoListPresentation) {
        // TO DO: Will be implemented
    }
    
    func removeToDo(at: Int) {
        // TO DO: Will be implemented
    }
}
