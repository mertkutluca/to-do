//
//  BookFetcher.swift
//  BookAPI
//
//  Created by mert.kutluca on 15.03.2021.
//

import Foundation
import Alamofire

public protocol BookFetcherProtocol {
    func fetch(completion: @escaping (Result<BooksResponse>) -> Void)
}

public final class BookFetcher: BookFetcherProtocol {
    
    private let serverUrl = "https://rss.itunes.apple.com/api/v1/tr/books/top-free/all/100/explicit.json"
    
    public init() {}
    
    public func fetch(completion: @escaping (Result<BooksResponse>) -> Void) {
        AF.request(serverUrl).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(BooksResponse.self, from: data)
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
