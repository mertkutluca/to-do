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
}

protocol BookListVMOutputDelegate: class {
    func booksLoaded()
}
