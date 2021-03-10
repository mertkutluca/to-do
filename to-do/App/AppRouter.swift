//
//  AppRouter.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import UIKit

final class AppRouter {
    
    var mainWindow: UIWindow?
    
    func start(window: UIWindow) {
        mainWindow = window
        let vc = ToDoListBuilder.build()
        let nc = UINavigationController(rootViewController: vc)
        // Has to crash if window not exist
        mainWindow!.rootViewController = nc
        mainWindow!.makeKeyAndVisible()
    }
}

extension AppRouter: ToDoListNavigationDelegate {
    func showDetail(for toDoId: String?) {
        let vc = TodoDetailBuilder.build(for: toDoId)
        guard let window = mainWindow, let rvt = window.rootViewController else {
            fatalError("main window or rootViewController not exist")
        }
        rvt.present(vc, animated: true, completion: nil)
    }
}
