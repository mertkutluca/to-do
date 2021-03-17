//
//  BookListVM.swift
//  to-do
//
//  Created by mert.kutluca on 16.03.2021.
//

import Foundation

final class BookListVM: BookListVMProtocol {
    
    weak var delegate: BookListVMOutputDelegate?
    
    private let networkManager: NetworkManageerProtocol
    private var books: [BookPresentation] = []
    
    init(networkManager: NetworkManageerProtocol) {
        self.networkManager = networkManager
    }
    
    func load() {
        networkManager.fetchBooks { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let fetchedBooks):
                self.books = fetchedBooks.map {
                    BookPresentation(artist: $0.artist, name: $0.name, imageUrl: $0.imageUrl)
                }
                self.delegate?.booksLoaded()
            case .fail(let error):
                print(error)
            }
        }
    }
    
    func getNumberOfItem() -> Int {
        return books.count
    }
    
    func getItem(at index: Int) -> BookPresentation {
        return books[index]
    }
        
}
