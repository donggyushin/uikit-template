//
//  StateManager.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation

final class StateManager {
    
    let viewModel: ViewModel
    let secondViewModel: SecondViewModel
    
    init(feedRepository: FeedRepository) {
        viewModel = .init(feedRepository: feedRepository)
        secondViewModel = .init(feedRepository: feedRepository)
        
        viewModel.delegate = self
        secondViewModel.delegate = self
    }
    
    func sync(_ feed: Feed) {
        if let index = viewModel.feeds.firstIndex(where: { $0.id == feed.id }) {
            viewModel.feeds[index] = feed
        }
        
        if let index = secondViewModel.feeds.firstIndex(where: { $0.id == feed.id }) {
            if !feed.saved {
                secondViewModel.feeds.remove(at: index)
            }
        } else {
            if feed.saved {
                secondViewModel.feeds.insert(feed, at: 0)
            }
        }
    }
}

extension StateManager: FeedViewModelDelegate {
    func updated(_ feed: Feed) {
        self.sync(feed)
    }
}
