//
//  FeedRepositoryImpl.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation

public final class FeedRepositoryImpl: FeedRepository {
    public init() { }
    
    public func fetchFeed() async throws -> [Feed] {
        [
            .text(TextFeed(
                id: "1",
                text: "Hello, this is a text feed!",
                saved: false
            )),
            .image(ImageFeed(
                id: "2",
                url: URL(string: "https://picsum.photos/200/300")!,
                saved: false
            )),
            .text(TextFeed(
                id: "3",
                text: "Another text feed with some content",
                saved: true
            )),
            .image(ImageFeed(
                id: "4",
                url: URL(string: "https://picsum.photos/400/300")!,
                saved: true
            )),
            .text(TextFeed(
                id: "5",
                text: "Third text feed example",
                saved: false
            ))
        ]
    }
    
    public func updateFeed(_ feed: Feed) async throws -> Feed {
        feed
    }
}
