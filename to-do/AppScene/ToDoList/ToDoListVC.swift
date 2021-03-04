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
        print("Trigger add todo scene here")
    }
    
    // MARK: Segmented Control
    @IBAction private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ToDoListVC: ToDoListVMOutputDelegate {
    func updateTable(_ insertions: [IndexPath], deletions: [IndexPath]) {
        // TO DO: Update table here
    }
}
