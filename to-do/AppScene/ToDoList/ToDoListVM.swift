//
//  ToDoListVM.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

final class ToDoListVM: ToDoListVMProtocol {
    var delegate: ToDoListVMOutputDelegate?
    
    var items: [ToDoListItemPresentation] = []
    
    func load() {
        items = [
            ToDoListItemPresentation(title: "title 1",
                                            detail: "detail 1",
                                            dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                            isExpired: false),
            ToDoListItemPresentation(title: "title 2",
                                            detail: "detail 2",
                                            dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                            isExpired: false),
            ToDoListItemPresentation(title: "title 3",
                                            detail: "detail 3",
                                            dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                            isExpired: false),
            ToDoListItemPresentation(title: "title 4",
                                            detail: "detail 4",
                                            dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                            isExpired: false),
            ToDoListItemPresentation(title: "title 5",
                                            detail: "detail 5",
                                            dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                            isExpired: false),
        ]
    }
    
    func getNumberOfItem() -> Int {
        return items.count
    }
    
    func getItem(at: Int) -> ToDoListItemPresentation {
        return items[at]
    }
    
    func addToDo(addingToDo: ToDoListItemPresentation) {
        // TO DO: Will be implemented
    }
    
    func removeToDo(at: Int) {
        // TO DO: Will be implemented
    }
}
