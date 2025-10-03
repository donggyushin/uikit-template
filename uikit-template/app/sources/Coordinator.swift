//
//  Coordinator.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation
import UIKit

final class AppCoordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(window: UIWindow) {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([ViewController(), SecondViewController()], animated: true)
        navigationController.setViewControllers([tabBarController], animated: true)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
