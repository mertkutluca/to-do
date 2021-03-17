//
//  BookListContracts.swift
//  to-do
//
//  Created by mert.kutluca on 16.03.2021.
//

import Foundation

protocol BookListVMProtocol {
    var delegate: BookListVMOutputDelegate? { get set }
    
    func load()
    func getNumberOfItem() -> Int
    func getItem(at index: Int) -> BookPresentation
    func getDownloadableImage(at index: Int) -> DownloadableImage?
    func startDownloadImage(at index: Int)
}

protocol BookListVMOutputDelegate: class {
    func booksLoaded()
    func imageDownloaded(at index: Int)
}
