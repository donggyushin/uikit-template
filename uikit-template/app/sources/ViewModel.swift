//
//  ViewModel.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation
import Combine

final class ViewModel {
    @Published var feeds: [Feed] = []
    
    let feedRepository: FeedRepository
    
    init(feedRepository: FeedRepository) {
        self.feedRepository = feedRepository
    }
    
    @MainActor
    func fetchFeeds() async throws {
        feeds = try await feedRepository.fetchFeed()
    }
    
    @MainActor
    func save(_ feed: Feed) async throws {
        var feed = feed
        
        switch feed {
        case .text(var textFeed):
            textFeed.saved.toggle()
            feed = .text(textFeed)
        case .image(var imageFeed):
            imageFeed.saved.toggle()
            feed = .image(imageFeed)
        }
        
        try await feedRepository.updateFeed(feed)
        
        guard let index = feeds.firstIndex(where: { $0.id == feed.id }) else { return }
        
        feeds[index] = feed
    }
}
