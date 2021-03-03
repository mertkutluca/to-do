//
//  ToDoListVM.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

final class ToDoListVM: ToDoListVMProtocol {
    var delegate: ToDoListVMOutputDelegate?
    
    func load() {
        
    }
    
    func getNumberOfItem() -> Int {
        return 0
    }
    
    func getItem(at: Int) -> ToDoListItemPresentation {
        return ToDoListItemPresentation(title: "title 1",
                                        detail: "detail 1",
                                        dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                        isExpired: false)
    }
    
    func addToDo(addingToDo: ToDoListItemPresentation) {
        // TO DO: Will be implemented
    }
    
    func removeToDo(at: Int) {
        // TO DO: Will be implemented
    }
}
