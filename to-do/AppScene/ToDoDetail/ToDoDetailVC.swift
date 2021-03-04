//
//  ToDoDetailVC.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import UIKit

final class ToDoDetailVC: UIViewController {
    var vm: ToDoDetailVMProtocol? {
        didSet {
            vm?.delegate = self
        }
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

extension ToDoDetailVC: ToDoDetailVMOutputDelegate {
    
    func handleUpdate(_ title: String?, detail: String?, dueDate: Date?, state: ToDoState?) {
        print("Handle ui update here")
    }
    
}
