//
//  RealmHandler.swift
//  to-do
//
//  Created by mert.kutluca on 11.03.2021.
//

import Foundation
import RealmSwift

final class RealmManager: DatabaseManager {
    private var realm = {
        return try! Realm()
    }()
    
    func save(object: Object) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func delete<T>(_ model: T.Type, _id: String) where T : Object {
        guard let object = get(model, key: _id) else {
            print("Try to delete not existent object")
            return
        }
        
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func getAll<T>(_ model: T.Type, filter: String?) -> [T] where T : Object {
        if let filter = filter {
            return Array(realm.objects(model).filter(filter))
        } else {
            return Array(realm.objects(model))
        }
    }
    
    func get<T>(_ model: T.Type, key: String) -> T? where T : Object {
        return realm.object(ofType: model, forPrimaryKey: key)
    }
}
