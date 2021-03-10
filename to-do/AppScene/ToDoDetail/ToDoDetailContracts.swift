//
//  ToDoDetailContracts.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import Foundation

protocol ToDoDetailVMProtocol {
    var delegate: ToDoDetailVMOutputDelegate? { get set }
    
    func load()
    
    func delete(_ completion: (_ success: Bool) -> Void)
    func save(title: String,
              detail: String,
              dueDate: Date,
              state: ToDoState,
              completion: (_ success: Bool) -> Void)
    
    func getTitle() -> String
    func getDetail() -> String
    func getDueDate() -> Date
    func getState() -> ToDoState
    func isNewToDo() -> Bool
}

protocol ToDoDetailVMOutputDelegate: class {
    func handleUpdate(_ title: String?, detail: String?, dueDate: Date?, state: ToDoState?)
}
