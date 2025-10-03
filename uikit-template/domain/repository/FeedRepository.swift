//
//  FeedRepository.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation

public protocol FeedRepository {
    func fetchFeed() async throws -> [Feed]
    func updateFeed(_ feed: Feed) async throws -> Feed
}
