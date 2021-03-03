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
    
    func getNumberOfItem() -> Int
    func getItem(at: Int) -> ToDoListItemPresentation
    
    func addToDo(addingToDo: ToDoListItemPresentation)
    func removeToDo(at: Int)
}

protocol ToDoListVMOutputDelegate {
    func updateTable(_ insertions: [IndexPath], deletions: [IndexPath])
}

protocol ToDoListNavigationDelegate {
    func showDetail()
}
