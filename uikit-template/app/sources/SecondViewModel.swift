//
//  SecondViewModel.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation
import Combine

final class SecondViewModel {
    @Published var feeds: [Feed] = []
    
    let feedRepository: FeedRepository
    
    weak var delegate: FeedViewModelDelegate?
    
    init(feedRepository: FeedRepository) {
        self.feedRepository = feedRepository
    }
    
    @MainActor
    func fetchFeeds() async throws {
        feeds = try await feedRepository.fetchSavedFeed()
    }
    
    @MainActor func unsaveFeed(_ feed: Feed) async throws {
        var feed = feed
        
        switch feed {
        case .text(var textFeed):
            textFeed.saved.toggle()
            feed = .text(textFeed)
        case .image(var imageFeed):
            imageFeed.saved.toggle()
            feed = .image(imageFeed)
        }
        
        delegate?.updated(feed)
        
        try await feedRepository.updateFeed(feed)
    }
}
