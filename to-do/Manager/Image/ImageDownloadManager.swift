//
//  ImageDownloadManager.swift
//  to-do
//
//  Created by mert.kutluca on 17.03.2021.
//

import Foundation

protocol ImageDownloadManagerProtocol {
    func startDownload(downloadableImage: DownloadableImage, completion: @escaping () -> Void)
}

final class ImageDownloadManager: ImageDownloadManagerProtocol {
    
    private var downloadsInProgress: [String: Operation] = [:]
    
    private lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Image Download Queue"
        queue.maxConcurrentOperationCount = 8
        return queue
    }()
    
    func startDownload(downloadableImage: DownloadableImage, completion: @escaping () -> Void) {
        let urlStringForIdentify: String = downloadableImage.url.absoluteString
        guard downloadsInProgress[urlStringForIdentify] == nil else {
            return
          }
        
        let downloadOperation = ImageDownloadOperation(downloadableImage: downloadableImage)
        downloadOperation.completionBlock = {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { completion(); return }
                self.downloadsInProgress.removeValue(forKey: urlStringForIdentify)
                completion()
            }
        }
        
        downloadsInProgress[urlStringForIdentify] = downloadOperation
        downloadQueue.addOperation(downloadOperation)
    }
}
