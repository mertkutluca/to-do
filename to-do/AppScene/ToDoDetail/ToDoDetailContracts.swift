//
//  ToDoDetailContracts.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import Foundation

protocol ToDoDetailVMProtocol {
    var delegate: ToDoDetailVMOutputDelegate? { get set }
    
    var forcedItem: ToDoDetailPresentation { get }
    
    func load()
    func delete(_ completion: (_ success: Bool) -> Void)
    func save(title: String,
              detail: String,
              dueDate: Date,
              state: ToDoState,
              completion: (_ success: Bool) -> Void)
    func showBooks()
}

protocol ToDoDetailVMOutputDelegate: class {
    func handleUpdate(_ title: String?, detail: String?, dueDate: Date?, state: ToDoState?)
}

protocol ToDoDetailNavigationDelegate: class {
    func showBooks()
}
