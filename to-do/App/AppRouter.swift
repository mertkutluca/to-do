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
    
    private func getTopVC() -> UIViewController {
        guard let window = mainWindow, var topVC = window.rootViewController else {
            fatalError("main window or rootViewController not exist")
        }
        while let presentedViewController = topVC.presentedViewController {
            topVC = presentedViewController
        }
        return topVC
    }
}

extension AppRouter: ToDoListNavigationDelegate {
    func showDetail(for toDo: ToDoDTO?) {
        let vc = TodoDetailBuilder.build(for: toDo)
        self.getTopVC().present(vc, animated: true, completion: nil)
    }
}

extension AppRouter: ToDoDetailNavigationDelegate {
    func showBooks() {
        let vc = BookListBuilder.build()
        self.getTopVC().present(vc, animated: true, completion: nil)
    }
}
