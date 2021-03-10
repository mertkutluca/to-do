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
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "To Do List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(showAddTodo))
    }
    
    @objc private func showAddTodo() {
        vm?.showCreateNewToDo()
    }
    
    // MARK: Segmented Control
    @IBAction private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if let segmentedState = ToDoState(rawValue: segmentedControl.selectedSegmentIndex) {
            vm?.startObserving(for: segmentedState)
        }
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let segmentedState = ToDoState(rawValue: segmentedControl.selectedSegmentIndex),
            let todo = vm?.getItem(at: indexPath.row, for: segmentedState) else {
            fatalError("Can not create segmented state or todo object")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo-list-cell", for: indexPath)
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = todo.detail
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard
            let segmentedState = ToDoState(rawValue: segmentedControl.selectedSegmentIndex),
            let numberOfItem = vm?.getNumberOfItem(for: segmentedState) else {
            fatalError("Can not create segmented state or numberOfItem")
        }
        
        return numberOfItem
    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        guard let segmentedState = ToDoState(rawValue: segmentedControl.selectedSegmentIndex) else {
            return
        }
        
        vm?.showDetail(at: indexPath.row, for: segmentedState)
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        guard let segmentedState = ToDoState(rawValue: segmentedControl.selectedSegmentIndex) else {
            return
        }
        if editingStyle == .delete {
            vm?.removeToDo(at: indexPath.row, for: segmentedState)
        }
    }
}

extension ToDoListVC: ToDoListVMOutputDelegate {
    func updateTable(_ insertions: [IndexPath], deletions: [IndexPath], modifications: [IndexPath]) {
        tableView.performBatchUpdates({
            tableView.deleteRows(at: deletions, with: .automatic)
            tableView.insertRows(at: insertions, with: .automatic)
            tableView.reloadRows(at: modifications, with: .automatic)
        })
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
}
