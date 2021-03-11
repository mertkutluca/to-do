//
//  BaseRepository.swift
//  to-do
//
//  Created by mert.kutluca on 11.03.2021.
//
import RealmSwift

class BaseRepository<T> {
    var manager: DatabaseManager
    
    required init(manager: DatabaseManager) {
        self.manager = manager
    }
    
    func save(object: Object) {
        manager.save(object: object)
    }
    
    func delete<T>(_ model: T.Type, _id: String) where T : Object {
        manager.delete(model, _id: _id)
    }
    
    func getAll<T>(_ model: T.Type, filter: String?) -> [T] where T : Object {
        return manager.getAll(model, filter: filter)
    }
    
    func get<T>(_ model: T.Type, key: String) -> T? where T : Object {
        return manager.get(model, key: key)
    }
}
