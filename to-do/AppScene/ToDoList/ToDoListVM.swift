//
//  ToDoListVM.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation
import RealmSwift

final class ToDoListVM: ToDoListVMProtocol {
    
    weak var delegate: ToDoListVMOutputDelegate?
    var navDelegate: ToDoListNavigationDelegate?
    
    private let completedTodos: Results<ToDo> = app.databaseManager.getTodos().filter("state == 1")
    private let activeTodos: Results<ToDo> = app.databaseManager.getTodos().filter("state == 0")
    
    func load() {
        
    }
    
    func getNumberOfItem(for state: ToDoState) -> Int {
        switch state {
        case .completed:
            return completedTodos.count
        case .active:
            return activeTodos.count
        }
    }
    
    func getItem(at: Int, for state: ToDoState) -> ToDoListPresentation {
        switch state {
        case .completed:
            return completedTodos[at].toPresent()
        case .active:
            return activeTodos[at].toPresent()
        }
    }
    
    func addToDo(addingToDo: ToDoListPresentation) {
        // TO DO: Will be implemented
    }
    
    func removeToDo(at: Int, for state: ToDoState) {
        // TO DO: Will be implemented
    }
    
    func showDetail(at: Int, for state: ToDoState) {
        let toDoId: String
        switch state {
        case .completed:
            toDoId = completedTodos[at]._id
        case .active:
            toDoId = activeTodos[at]._id
        }
        navDelegate?.showDetail(for: toDoId)
    }
    
    func showCreateNewToDo() {
        navDelegate?.showDetail(for: nil)
    }
}
