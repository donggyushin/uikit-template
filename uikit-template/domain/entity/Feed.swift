//
//  Feed.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation

public enum Feed {
    var id: String {
        switch self {
        case .text(let textFeed):
            textFeed.id
        case .image(let imageFeed):
            imageFeed.id
        }
    }
    // associated type
    case text(TextFeed)
    case image(ImageFeed)
}
