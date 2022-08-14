//
//  ImageLoadingPresentor.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 04.08.2022.
//

import Foundation
import SwiftUI

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    private let networkManager = NetworkManager.instance
    private let cacheManager = ImageCacheManager.instance
    
    let urlString: String
    
    init(url: String) {
        urlString = url
        getImage()
    }
    
    func getImage() {
        if let cachedImage = cacheManager.get(key: urlString) {
            image = cachedImage
        } else {
            Task {
                try? await downloadImage()
            }
        }
    }
    
    func downloadImage() async throws {
        await MainActor.run {
            isLoading = true
        }
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        guard let fethedData = try? await networkManager.download(url: url) else {
            throw URLError(.badServerResponse)
        }
        guard let image = UIImage(data: fethedData) else {
            throw URLError(.cannotCreateFile)
        }
        await MainActor.run {
            self.image = image
            isLoading = false
        }
        cacheManager.add(key: self.urlString, value: image)
    }
}
