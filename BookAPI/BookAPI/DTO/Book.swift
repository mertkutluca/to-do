//
//  Book.swift
//  BookAPI
//
//  Created by mert.kutluca on 15.03.2021.
//

import Foundation

public struct Book: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case artists = "authors"
        case name = "title"
        case imageUrl = "thumbnailUrl"
    }
    
    public let artists: [String]
    public let name: String
    public let imageUrl: URL?
    
    public init(artists: [String], name: String, imageUrl: URL?) {
        self.artists = artists
        self.name = name
        self.imageUrl = imageUrl
    }
}

extension Book: Equatable {
    public static func ==(lhs: Book, rhs: Book) -> Bool {
        return
            lhs.artists == rhs.artists &&
            lhs.name == rhs.name &&
            lhs.imageUrl == rhs.imageUrl
    }
}
