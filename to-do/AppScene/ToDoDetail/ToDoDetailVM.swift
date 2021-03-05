//
//  ToDoDetailVM.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import Foundation

final class ToDoDetailVM: ToDoDetailVMProtocol {
    
    weak var delegate: ToDoDetailVMOutputDelegate?
    
    private var item: ToDoDetailPresentation?
    
    func load() {
        item = ToDoDetailPresentation(title: "title title",
                                      detail: "detail detail detail detail detail detail detail detail detail",
                                      dueDate: Date(timeIntervalSince1970: TimeInterval(1614772747)),
                                      state: .active,
                                      isNewTodo: false)
    }
    
    func delete() {
        // Delete after database manager
        print("Handle delete")
    }
    
    func save(title: String, detail: String, dueDate: Date, state: ToDoState) {
        // Save after database manager
        print("Handle save")
    }
    
    func getTitle() -> String {
        return forcedItem.title
    }
    
    func getDetail() -> String {
        return forcedItem.detail
    }
    
    func getDueDate() -> Date {
        return forcedItem.dueDate
    }
    
    func getState() -> ToDoState {
        return forcedItem.state
    }
    
    func isNewToDo() -> Bool {
        return forcedItem.isNewTodo
    }
    
    // MARK: Helpers
    private lazy var forcedItem: ToDoDetailPresentation = {
        guard let item = item else {
            fatalError("Presentation can not be loaded properly")
        }
        return item
    }()
    
}
