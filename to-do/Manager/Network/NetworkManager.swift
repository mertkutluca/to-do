//
//  NetworkManager.swift
//  to-do
//
//  Created by mert.kutluca on 16.03.2021.
//

import BookAPI

protocol NetworkManageerProtocol {
    func fetchBooks(completion: @escaping (Result<Array<Book>>) -> Void)
}

final class NetworkManager: NetworkManageerProtocol {
    
    let bookFetcher: BookFetcherProtocol = BookFetcher()
    
    func fetchBooks(completion: @escaping (Result<Array<Book>>) -> Void) {
        bookFetcher.fetch(completion: completion)
    }
}
