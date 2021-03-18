//
//  BaseRepository.swift
//  to-do
//
//  Created by mert.kutluca on 11.03.2021.
//
import RealmSwift
import Foundation

protocol RepositoryObservingDelegate: class {
    func handleChanges(_ deletions: [Int], insertions: [Int], modifications: [Int])
}

class BaseRepository<T> {
    private var manager: DatabaseManager
    
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
    
    func subscribe<T>(_ model: T.Type,
                    filter: String?,
                    notify: @escaping (_ deletions: [Int], _ insertions: [Int], _ modifications: [Int]) -> Void) where T : Object {
        manager.subscribe(model, filter: filter) { (deletions, insertions, modifications) in
            notify(deletions, insertions, modifications)
        }
    }
}
