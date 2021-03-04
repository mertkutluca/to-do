//
//  ToDoListVM.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

final class ToDoListVM: ToDoListVMProtocol {
    var delegate: ToDoListVMOutputDelegate?
    
    private let todos: [ToDoListItemPresentation] = [
        ToDoListItemPresentation(title: "title 1",
                                 detail: "detail 1",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                 state: .active),
        ToDoListItemPresentation(title: "title 2",
                                 detail: "detail 2",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                 state: .expired),
        ToDoListItemPresentation(title: "title 3",
                                 detail: "detail 3",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                 state: .active),
        ToDoListItemPresentation(title: "title 4",
                                 detail: "detail 4",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                 state: .expired),
        ToDoListItemPresentation(title: "title 5",
                                 detail: "detail 5",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                 state: .active),
        ToDoListItemPresentation(title: "title 6",
                                 detail: "detail 6",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                 state: .active),
        ToDoListItemPresentation(title: "title 7",
                                 detail: "detail 7",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                 state: .expired),
        ToDoListItemPresentation(title: "title 8",
                                 detail: "detail 8",
                                 dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                 state: .active),
    ]
    
    private var expiredTodos: [ToDoListItemPresentation] = []
    private var activeTodos: [ToDoListItemPresentation] = []
    
    func load() {
        expiredTodos = todos.filter({ (todo) -> Bool in
            todo.state == .expired
        })
        
        activeTodos = todos.filter({ (todo) -> Bool in
            todo.state == .active
        })
    }
    
    func getNumberOfItem(for state: ToDoState) -> Int {
        switch state {
        case .expired:
            return expiredTodos.count
        case .active:
            return activeTodos.count
        }
    }
    
    func getItem(at: Int, for state: ToDoState) -> ToDoListItemPresentation {
        switch state {
        case .expired:
            return expiredTodos[at]
        case .active:
            return activeTodos[at]
        }
    }
    
    func addToDo(addingToDo: ToDoListItemPresentation) {
        // TO DO: Will be implemented
    }
    
    func removeToDo(at: Int) {
        // TO DO: Will be implemented
    }
}
