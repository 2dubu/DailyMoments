//
//  LoadableImageView.swift
//  DailyMoments
//
//  Created by 이건우 on 10/17/24.
//

import SwiftUI

struct LoadableImageView: View {
    @State private var isLoaded: Bool = false
    var imageUrl: URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        Group {
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .opacity(isLoaded ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 0.4)) { isLoaded = true }
                        }
                case .failure:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
        }
        .onAppear {
            isLoaded = false
        }
    }
}
