//
//  ToDoListVC.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import UIKit

final class ToDoListVC: UITableViewController {
    
    var vm: ToDoListVMProtocol? {
        didSet {
            vm?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "To Do List"
    }
    
    // UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = vm?.getItem(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo-list-cell", for: indexPath)
        cell.textLabel?.text = todo?.title
        cell.detailTextLabel?.text = todo?.detail
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfItem = vm?.getNumberOfItem() else {
            return 0
        }
        
        return numberOfItem
    }
    
    // UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ToDoListVC: ToDoListVMOutputDelegate {
    func updateTable(_ insertions: [IndexPath], deletions: [IndexPath]) {
        // TO DO: Update table here
    }
}
