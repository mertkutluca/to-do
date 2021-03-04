//
//  ToDoListBuilder.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import UIKit

final class ToDoListBuilder {
    
    static func build() -> ToDoListVC {
        let sb = UIStoryboard(name: "ToDoList", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! ToDoListVC
        let vm = ToDoListVM()
        vm.load()
        vm.navDelegate = app.router
        vc.vm = vm
        
        return vc
    }
}
