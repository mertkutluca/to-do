//
//  ToDoDetailVC.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import UIKit

final class ToDoDetailVC: UIViewController {
    
    var vm: ToDoDetailVMProtocol?
    
    @IBOutlet private weak var titleTextView: UITextView!
    @IBOutlet private weak var detailTextView: UITextView!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var isCompletedSwitch: UISwitch!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ToDo Details"
        
        // Fill ui
        guard let vm = vm else {
            fatalError("ToDoDetailVM not initialized before constructing view")
        }
        
        titleTextView.text = vm.forcedItem.title
        titleTextView.setBorderWithCorner()
        
        detailTextView.text = vm.forcedItem.detail
        detailTextView.setBorderWithCorner()
        
        datePicker.date = vm.forcedItem.dueDate
        deleteButton.isHidden = vm.forcedItem.isNewTodo
        isCompletedSwitch.isOn = vm.forcedItem.state == .completed
    }
    
    // MARK: Actions
    @IBAction func saveButtonPressed(_ sender: Any) {
        vm?.save(title: titleTextView.text,
                 detail: detailTextView.text,
                 dueDate: datePicker.date,
                 state: isCompletedSwitch.isOn ? .completed : .active) { success in
            if success {
                dismiss(animated: true, completion: nil)
            } else {
                // Show error prompt
            }
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        vm?.delete { success in
            if success {
                dismiss(animated: true, completion: nil)
            } else {
                // Show error prompt
            }
        }
    }
    @IBAction func booksButtonPressed(_ sender: Any) {
        vm?.showBooks()
    }
}

extension ToDoDetailVC: ToDoDetailVMOutputDelegate {
    
    func handleUpdate(_ title: String?, detail: String?, dueDate: Date?, state: ToDoState?) {
        if let title = title {
            titleTextView.text = title
        }
        
        if let detail = detail {
            detailTextView.text = detail
        }
        
        if let dueDate = dueDate {
            datePicker.date = dueDate
        }
        
        if let state = state {
            isCompletedSwitch.isOn = state == .completed
        }
    }
    
}

extension UITextView {
    func setBorderWithCorner() {
        self.layer.borderColor = UIColor.borderColor.cgColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 6
    }
}
