//
//  Books.swift
//  BookAPI
//
//  Created by mert.kutluca on 15.03.2021.
//

import Foundation

public struct BooksResponse: Decodable {
    
    public let books: [Book]
    
//    private enum MainCodingKey: String, CodingKey {
//        case feed
//    }
//
//    private enum FeedCodingKey: String, CodingKey {
//        case results
//    }
 
//    public init(from decoder: Decoder) throws {
//        let main = try decoder.container(keyedBy: MainCodingKey.self)
//        let feed = try main.nestedContainer(keyedBy: FeedCodingKey.self, forKey: .feed)
//        self.books = try feed.decode([Book].self, forKey: .results)
//    }
    
    
}
