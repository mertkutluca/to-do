//
//  ToDoRepository.swift
//  to-do
//
//  Created by mert.kutluca on 11.03.2021.
//

import Foundation

protocol ToDoRepositoryProtocol {
    func save(dto: ToDoDTO)
    func remove(_id: String)
    
    func getAll(filter: String?) -> [ToDoDTO]
    func get(key: String) -> ToDoDTO?
    
    func subscribe(filter: String?)
}

final class ToDoRepository: BaseRepository<ToDo> {
    weak var observingDelegate: RepositoryObservingDelegate?
}

extension ToDoRepository: ToDoRepositoryProtocol {
    
    func save(dto: ToDoDTO) {
        let object = dto.getDBObject()
        super.save(object: object)
    }
    
    func remove(_id: String) {
        super.delete(ToDo.self, _id: _id)
    }
    
    func getAll(filter: String?) -> [ToDoDTO] {
        let objects = super.getAll(ToDo.self, filter: filter)
        return objects.map { ToDoDTO.createWithDBObject(dbObject: $0) }
    }
    
    func get(key: String) -> ToDoDTO? {
        guard let object = super.get(ToDo.self, key: key) else {
            return nil
        }
        return ToDoDTO.createWithDBObject(dbObject: object)
    }
    
    func subscribe(filter: String?) {
        super.subscribe(ToDo.self, filter: filter) { (_ deletions: [Int], _ insertions: [Int], _ modifications: [Int]) in
            self.observingDelegate!.handleChanges(deletions, insertions: insertions, modifications: modifications)
        }
    }
}
