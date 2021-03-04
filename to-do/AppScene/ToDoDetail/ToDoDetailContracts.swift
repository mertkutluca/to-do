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
    
    func delete()
    func save(_ title: String, detail: String, dueDate: Date, state: ToDoState)
}

protocol ToDoDetailVMOutputDelegate: class {
    func handleUpdate(_ title: String?, detail: String?, dueDate: Date?, state: ToDoState?)
}
