//
//  ImageDownloadOperation.swift
//  to-do
//
//  Created by mert.kutluca on 17.03.2021.
//

import UIKit

final class ImageDownloadOperation: Operation {
    
    let downloadableImage: DownloadableImage
    
    init(downloadableImage: DownloadableImage) {
        self.downloadableImage = downloadableImage
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        guard let imageData = try? Data(contentsOf: downloadableImage.url) else {
            downloadableImage.image = UIImage(named: "error")
            downloadableImage.state = .failed
            return
        }
        
        if isCancelled {
            return
        }
        
        if imageData.isEmpty {
            downloadableImage.image = UIImage(named: "error")
            downloadableImage.state = .failed
        } else {
            downloadableImage.image = UIImage(data: imageData)
            downloadableImage.state = .downloaded
        }
    }
}
