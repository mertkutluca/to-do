//
//  Book.swift
//  BookAPI
//
//  Created by mert.kutluca on 15.03.2021.
//

import Foundation

public struct Book: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case name
        case imageUrl = "artworkUrl100"
    }
    
    public let artist: String
    public let name: String
    public let imageUrl: URL?
}
