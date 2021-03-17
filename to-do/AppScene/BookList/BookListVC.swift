//
//  BookListVC.swift
//  to-do
//
//  Created by mert.kutluca on 16.03.2021.
//

import UIKit

final class BookListVC: UIViewController {
    
    var vm: BookListVMProtocol?
    
    @IBOutlet private weak var tableView: UITableView!
}

extension BookListVC: UITableViewDelegate {
    
}

extension BookListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getNumberOfItem() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let book = vm?.getItem(at: indexPath.row) else {
            fatalError("Can not create book object")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "book-cell", for: indexPath)
        cell.textLabel?.text = book.name
        cell.detailTextLabel?.text = book.artist
        
        return cell
    }
    
}

extension BookListVC: BookListVMOutputDelegate {
    
    func booksLoaded() {
        tableView.reloadData()
    }
}
