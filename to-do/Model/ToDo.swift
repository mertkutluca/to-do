//
//  ToDo.swift
//  to-do
//
//  Created by mert.kutluca on 5.03.2021.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @objc dynamic var _id: String!
    dynamic var title: String!
    dynamic var detail: String!
    dynamic var dueDate: Date!
    dynamic var state: Int!
    
    convenience init(title: String, detail: String, dueDate: Date, state: ToDoState) {
        self.init()
        self._id = UUID().uuidString
        self.title = title
        self.detail = detail
        self.dueDate = dueDate
        self.state = state.rawValue
    }
    
    convenience init(dto: ToDoDTO) {
        self.init()
        self._id = UUID().uuidString
        self.title = dto.title
        self.detail = dto.detail
        self.dueDate = dto.dueDate
        self.state = dto.state.rawValue
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}
