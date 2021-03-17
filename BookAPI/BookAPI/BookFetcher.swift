//
//  BookFetcher.swift
//  BookAPI
//
//  Created by mert.kutluca on 15.03.2021.
//

import Foundation
import Alamofire

public protocol BookFetcherProtocol {
    func fetch(completion: @escaping (Result<Array<Book>>) -> Void)
}

public final class BookFetcher: BookFetcherProtocol {
    
    private let serverUrl = "https://raw.githubusercontent.com/benoitvallon/100-best-books/master/books.json"
    
    public init() {}
    
    public func fetch(completion: @escaping (Result<Array<Book>>) -> Void) {
        AF.request(serverUrl).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode([Book].self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.fail(error))
                }
            case .failure(let error):
                completion(.fail(error))
            }
        }
    }
    
}
