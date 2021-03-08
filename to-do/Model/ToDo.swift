//
//  ToDo.swift
//  to-do
//
//  Created by mert.kutluca on 5.03.2021.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @objc dynamic var _id: String = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String = ""
    @objc dynamic var dueDate: Date = Date()
    @objc dynamic var state: Int = 0
    
    convenience init(dto: ToDoDTO) {
        self.init()
        self.title = dto.title
        self.detail = dto.detail
        self.dueDate = dto.dueDate
        self.state = dto.state.rawValue
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}
