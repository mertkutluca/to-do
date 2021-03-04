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
    func getItem(at: Int, for state: ToDoState) -> ToDoListItemPresentation
    
    func addToDo(addingToDo: ToDoListItemPresentation)
    func removeToDo(at: Int, for state: ToDoState)
    
    func showDetail(at: Int, for state: ToDoState)
}

protocol ToDoListVMOutputDelegate {
    func updateTable(_ insertions: [IndexPath], deletions: [IndexPath])
}

protocol ToDoListNavigationDelegate {
    func showDetail()
}

enum ToDoState: Int {
    case active = 0
    case expired = 1
}
