//
//  TextFeed.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation

public struct TextFeed {
    public let id: String
    public let text: String
    public var saved: Bool
    
    public init(id: String, text: String, saved: Bool) {
        self.id = id
        self.text = text
        self.saved = saved
    }
}
