//
//  DownloadableImage.swift
//  to-do
//
//  Created by mert.kutluca on 17.03.2021.
//

import UIKit

enum DownloadableImageState {
    case initial, downloaded, failed
}

final class DownloadableImage {
    let url: URL
    var state = DownloadableImageState.initial
    var image: UIImage?
    
    init(url: URL) {
        self.url = url
    }
}
