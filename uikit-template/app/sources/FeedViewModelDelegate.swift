//
//  FeedViewModelDelegate.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation

protocol FeedViewModelDelegate: AnyObject {
    func updated(_ feed: Feed)
}
