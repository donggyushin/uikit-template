//
//  Container.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation

final class Container {
    
    static let shared = Container()
    
    private init() { }
    
    lazy var feedRepository: FeedRepository = {
        FeedRepositoryImpl()
    }()
}
