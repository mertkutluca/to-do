//
//  DatabaseManager.swift
//  to-do
//
//  Created by mert.kutluca on 5.03.2021.
//

import RealmSwift

protocol DatabaseManagerProtocol {
    func save(dto: ToDoDTO)
    func delete(_id: String)
    
    func getTodos() -> Results<ToDo>
    func getTodo(key: String) -> ToDo?
}

final class DatabaseManager: DatabaseManagerProtocol {

    private var realm = {
        return try! Realm()
    }()
    
    func save(dto: ToDoDTO) {
        let todo = ToDo(dto: dto)
        
        try! realm.write {
            realm.add(todo, update: .modified)
        }
    }
    
    func delete(_id: String) {
        guard let todo = getTodo(key: _id) else {
            print("Try to delete not existent todo")
            return
        }
        
        try! realm.write {
            realm.delete(todo)
        }
    }
    
    func getTodos() -> Results<ToDo> {
        return realm.objects(ToDo.self)
    }
    
    func getTodo(key: String) -> ToDo? {
        return realm.object(ofType: ToDo.self, forPrimaryKey: key)
    }
}
