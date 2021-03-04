//
//  ToDoListContracts.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

protocol ToDoListVMProtocol {
    var delegate: ToDoListVMOutputDelegate? { get set }
    
    func load()
    
    func getNumberOfItem(for state: ToDoState) -> Int
    func getItem(at: Int, for state: ToDoState) -> ToDoListPresentation
    
    func addToDo(addingToDo: ToDoListPresentation)
    func removeToDo(at: Int)
}

protocol ToDoListVMOutputDelegate {
    func updateTable(_ insertions: [IndexPath], deletions: [IndexPath])
}

protocol ToDoListNavigationDelegate {
    func showDetail()
}

enum ToDoState: Int {
    case active = 0
    case completed = 1
}
