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
    private let imageDownloadManager: ImageDownloadManager
    private var books: [BookPresentation] = []
    private var downloadableImages: [DownloadableImage?] = []
    
    init(networkManager: NetworkManageerProtocol, imageDownloadManager: ImageDownloadManager) {
        self.networkManager = networkManager
        self.imageDownloadManager = imageDownloadManager
    }
    
    func load() {
        networkManager.fetchBooks { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let fetchedBooks):
                self.books = fetchedBooks.map {
                    BookPresentation(artist: $0.artists.joined(separator: ", "), name: $0.name, imageUrl: $0.imageUrl)
                }
                self.downloadableImages = fetchedBooks.map({ book in
                    if let url = book.imageUrl {
                        return DownloadableImage(url: url)
                    } else {
                        return nil
                    }
                })
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
    
    func getDownloadableImage(at index: Int) -> DownloadableImage? {
        return downloadableImages[index]
    }
    
    func startDownloadImage(at index: Int) {
        guard let downloadableImage = downloadableImages[index] else {
            return
        }
        
        imageDownloadManager.startDownload(downloadableImage: downloadableImage) { [weak self] in
            self?.delegate?.imageDownloaded(at: index)
        }
    }
        
}
