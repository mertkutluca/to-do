//
//  ToDoDetailVM.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import Foundation

final class ToDoDetailVM: ToDoDetailVMProtocol {
    weak var delegate: ToDoDetailVMOutputDelegate?
    
    func load() {
        
    }
    
    func delete() {
        print("Handle delete")
    }
    
    func save(_ title: String, detail: String, dueDate: Date, state: ToDoState) {
        print("Handle save")
    }
    
}
