//
//  ToDoListVM.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

final class ToDoListVM: ToDoListVMProtocol {
    
    weak var delegate: ToDoListVMOutputDelegate?
    var navDelegate: ToDoListNavigationDelegate?
    
    private let repository: ToDoRepositoryProtocol
    
    private var completedTodos: [ToDoDTO]
    private var activeTodos: [ToDoDTO]
    
    private let completedStateQuery: String = "state == 1"
    private let activeStateQuery: String = "state == 0"
    private var currentState: ToDoState = .active
    
    init(repo: ToDoRepositoryProtocol) {
        repository = repo
        completedTodos = repository.getAll(filter: completedStateQuery)
        activeTodos = repository.getAll(filter: activeStateQuery)
    }
    
    func load() {
        self.startObserving(for: currentState)
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
        let toDoId: String
        switch state {
        case .completed:
            toDoId = completedTodos[at]._id
        case .active:
            toDoId = activeTodos[at]._id
        }
        repository.remove(_id: toDoId)
    }
    
    func showDetail(at: Int, for state: ToDoState) {
        switch state {
        case .completed:
            navDelegate?.showDetail(for: completedTodos[at])
        case .active:
            navDelegate?.showDetail(for: activeTodos[at])
        }
    }
    
    func showCreateNewToDo() {
        navDelegate?.showDetail(for: nil)
    }
    
    func startObserving(for state: ToDoState) {
        currentState = state
        repository.subscribe(filter: getQuery(for: currentState))
    }
    
    private func getQuery(for state: ToDoState) -> String {
        switch state {
        case .active:
            return activeStateQuery
        case .completed:
            return completedStateQuery
        }
    }
}

extension ToDoListVM: RepositoryObservingDelegate {
    func handleChanges(_ deletions: [Int], insertions: [Int], modifications: [Int]) {
        // Refresh todos on changes
        activeTodos = repository.getAll(filter: activeStateQuery)
        completedTodos = repository.getAll(filter: completedStateQuery)
        self.delegate?.updateTable(insertions.map({ IndexPath(row: $0, section: 0) }),
                                   deletions: deletions.map({ IndexPath(row: $0, section: 0)}),
                                   modifications: modifications.map({ IndexPath(row: $0, section: 0) }))
    }
}
