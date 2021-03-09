//
//  ToDoDetailBuilder.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import UIKit

final class TodoDetailBuilder {
    
    static func build(for toDoId: String?) -> ToDoDetailVC {
        let sb = UIStoryboard(name: "ToDoDetail", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! ToDoDetailVC
        let vm = ToDoDetailVM(id: toDoId)
        vm.load()
        vc.vm = vm
        
        return vc
    }
}
