//
//  ToDoDetailBuilder.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import UIKit

final class TodoDetailBuilder {
    
    static func build(for toDo: ToDoDTO?) -> ToDoDetailVC {
        let sb = UIStoryboard(name: "ToDoDetail", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! ToDoDetailVC
        let vm = ToDoDetailVM(toDo: toDo, repo: ToDoRepository(manager: app.databaseManager))
        vm.load()
        vc.vm = vm
        vm.delegate = vc
        vm.navDelegate = app.router
        
        return vc
    }
    
}
