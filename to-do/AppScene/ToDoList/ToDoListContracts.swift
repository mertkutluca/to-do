//
//  ToDoListContracts.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

protocol ToDoListVMProtocol {
    var delegate: ToDoListVMOutputDelegate? { get set }
    var navDelegate: ToDoListNavigationDelegate? { get set }
    
    func load()
    
    func getNumberOfItem(for state: ToDoState) -> Int
    func getItem(at: Int, for state: ToDoState) -> ToDoListPresentation
    
    func addToDo(addingToDo: ToDoListPresentation)
    func removeToDo(at: Int, for state: ToDoState)
    
    func showDetail(at: Int, for state: ToDoState)
    func showCreateNewToDo()
    
    func startObserving(for state: ToDoState)
}

protocol ToDoListVMOutputDelegate: class {
    func updateTable(_ insertions: [IndexPath], deletions: [IndexPath], modifications: [IndexPath])
    func reloadTable()
}

protocol ToDoListNavigationDelegate: class {
    func showDetail(for toDo: ToDoDTO?)
}
