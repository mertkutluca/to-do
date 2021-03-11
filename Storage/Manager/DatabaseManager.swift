//
//  DatabaseManager.swift
//  to-do
//
//  Created by mert.kutluca on 11.03.2021.
//

import RealmSwift

protocol DatabaseManager {
    func save(object: Object)
    func delete<T>(_ model: T.Type, _id: String) where T : Object
    func getAll<T>(_ model: T.Type, filter: String?) -> [T] where T : Object
    func get<T>(_ model: T.Type, key: String) -> T? where T : Object
}
