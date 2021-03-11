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
    
    private let repository: ToDoRepository = ToDoRepository(manager: app.databaseManager)
    
    private lazy var completedTodos: [ToDoDTO] = repository.getAll(filter: "state == 1")
    private lazy var activeTodos: [ToDoDTO] = repository.getAll(filter: "state == 0")
    
    func load() {
        self.startObserving(for: .active)
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
//        switch state {
//        case .completed:
//            activeToken?.invalidate()
//            completedToken = completedTodos.observe { [weak self] (changes: RealmCollectionChange) in
//                guard let self = self else { return }
//                self.handleChanges(changes: changes)
//            }
//        case .active:
//            completedToken?.invalidate()
//            activeToken = activeTodos.observe { [weak self] (changes: RealmCollectionChange) in
//                guard let self = self else { return }
//                self.handleChanges(changes: changes)
//            }
//        }
    }
    
//    private func handleChanges(changes: RealmCollectionChange<Results<ToDo>>) {
//        switch changes {
//        case .initial:
//            self.delegate?.reloadTable()
//        case .update(_, let deletions, let insertions, let modifications):
//            self.delegate?.updateTable(insertions.map({ IndexPath(row: $0, section: 0) }),
//                                       deletions: deletions.map({ IndexPath(row: $0, section: 0)}),
//                                       modifications: modifications.map({ IndexPath(row: $0, section: 0) }))
//        case .error(let error):
//            // An error occurred while opening the Realm file on the background worker thread
//            fatalError("\(error)")
//        }
//    }
}
