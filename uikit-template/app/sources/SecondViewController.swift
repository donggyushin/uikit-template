//
//  SecondViewController.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation
import UIKit

final class SecondViewController: UIViewController {
    
    let viewModel: SecondViewModel
    
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
