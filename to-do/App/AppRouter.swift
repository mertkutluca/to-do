//
//  AppRouter.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import UIKit

final class AppRouter {
    
    func start(window: UIWindow) {
        let vc = ToDoListBuilder.build()
        let nc = UINavigationController(rootViewController: vc)
        window.rootViewController = nc
        window.makeKeyAndVisible()
    }
}
