//
//  ToDoDTO.swift
//  to-do
//
//  Created by mert.kutluca on 5.03.2021.
//

import Foundation

struct ToDoDTO {
    let _id: String
    let title: String
    let detail: String
    let dueDate: Date
    let state: ToDoState
    
    init(_id: String, title: String, detail: String, dueDate: Date, state: ToDoState) {
        self._id = _id
        self.title = title
        self.detail = detail
        self.dueDate = dueDate
        self.state = state
    }
    
    func getDBObject() -> ToDo {
        return ToDo(dto: self)
    }
    
    static func createWithDBObject(dbObject: ToDo) -> ToDoDTO {
        return ToDoDTO(_id: dbObject._id,
                       title: dbObject.title,
                       detail: dbObject.detail,
                       dueDate: dbObject.dueDate,
                       state: ToDoState(rawValue: dbObject.state) ?? .active)
    }
    
    func toPresent() -> ToDoListPresentation {
        return ToDoListPresentation(title: self.title,
                                    detail: self.detail,
                                    dueDate: self.dueDate,
                                    state: self.state)
    }
}
