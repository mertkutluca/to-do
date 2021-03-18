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
        
        if let downloadableImage = vm?.getDownloadableImage(at: indexPath.row) {
            switch downloadableImage.state {
            case .initial:
                cell.imageView?.image = UIImage(named: "placeholder")
                vm?.startDownloadImage(at: indexPath.row)
            case .downloaded:
                if let image = downloadableImage.image {
                    cell.imageView?.image = image
                } else {
                    cell.imageView?.image = UIImage(named: "error")
                }
            case .failed:
                cell.imageView?.image = UIImage(named: "error")
            }
        }
        
        return cell
    }
    
}

extension BookListVC: BookListVMOutputDelegate {
    
    func booksLoaded() {
        tableView.reloadData()
    }
    
    func imageDownloaded(at index: Int) {
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
}
