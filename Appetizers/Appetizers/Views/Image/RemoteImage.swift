//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Sravya Kaki on 2025-05-09.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromUrlString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async
             {
                self.image = Image(uiImage: uiImage)
            }
        }
        
    }
}

struct RemoteImage: View {
    var image: Image? = nil
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.load(fromUrlString: urlString)
            }
    }
}
