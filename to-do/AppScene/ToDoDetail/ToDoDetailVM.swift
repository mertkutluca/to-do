//
//  ToDoDetailVM.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import Foundation

final class ToDoDetailVM: ToDoDetailVMProtocol {
    
    weak var delegate: ToDoDetailVMOutputDelegate?
    weak var navDelegate: ToDoDetailNavigationDelegate?
    
    private var item: ToDoDetailPresentation?
    
    private let toDo: ToDoDTO?
    
    private let repository: ToDoRepositoryProtocol
    
    lazy var forcedItem: ToDoDetailPresentation = {
        guard let item = item else {
            fatalError("Presentation can not be loaded properly")
        }
        return item
    }()
    
    init(toDo: ToDoDTO?, repo: ToDoRepositoryProtocol) {
        self.toDo = toDo
        repository = repo
    }
    
    func load() {
        guard let toDo = toDo else {
            item = ToDoDetailPresentation.empty
            return
        }
        
        item = ToDoDetailPresentation(title: toDo.title,
                                      detail: toDo.detail,
                                      dueDate: toDo.dueDate,
                                      state: toDo.state,
                                      isNewTodo: false)
        
    }
    
    func delete(_ completion: (Bool) -> Void) {
        guard let _id = toDo?._id else {
            completion(false)
            return
        }
        repository.remove(_id: _id)
        completion(true)
    }
    
    func save(title: String, detail: String, dueDate: Date, state: ToDoState, completion: (Bool) -> Void) {
        // Will be changed
        let dto = ToDoDTO(_id: toDo?._id ?? UUID().uuidString,
                          title: title,
                          detail: detail,
                          dueDate: dueDate,
                          state: state)
        repository.save(dto: dto)
        completion(true)
    }
    
    func showBooks() {
        navDelegate?.showBooks()
    }
    
}
