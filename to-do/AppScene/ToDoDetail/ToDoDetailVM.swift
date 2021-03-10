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
    
    private let toDoId: String?
    
    init(id: String?) {
        toDoId = id
    }
    
    func load() {
        guard let id = toDoId, let toDoDTO = app.databaseManager.getTodo(key: id) else {
            item = ToDoDetailPresentation.empty
            return
        }
        
        item = ToDoDetailPresentation(title: toDoDTO.title,
                                      detail: toDoDTO.detail,
                                      dueDate: toDoDTO.dueDate,
                                      state: ToDoState(rawValue: toDoDTO.state) ?? .active,
                                      isNewTodo: false)
    }
    
    func delete(_ completion: (Bool) -> Void) {
        guard let _id = toDoId else {
            completion(false)
            return
        }
        app.databaseManager.delete(_id: _id)
        completion(true)
    }
    
    func save(title: String, detail: String, dueDate: Date, state: ToDoState, completion: (Bool) -> Void) {
        app.databaseManager.save(dto: ToDoDTO(_id: toDoId ?? UUID().uuidString,
                                              title: title,
                                              detail: detail,
                                              dueDate: dueDate,
                                              state: state))
        completion(true)
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
