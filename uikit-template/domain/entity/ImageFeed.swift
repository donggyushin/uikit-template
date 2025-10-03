//
//  ImageFeed.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation

public struct ImageFeed {
    public let id: String
    public let url: URL
    public var saved: Bool
    
    public init(id: String, url: URL, saved: Bool) {
        self.id = id
        self.url = url
        self.saved = saved
    }
}
