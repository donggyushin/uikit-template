//
//  SecondViewController.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation
import UIKit
import SnapKit
import Combine

final class SecondViewController: UIViewController {
    
    let viewModel: SecondViewModel
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(TextCell.self, forCellReuseIdentifier: TextCell.identifier)
        view.register(ImageCell.self, forCellReuseIdentifier: ImageCell.identifier)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        Task {
            try await viewModel.fetchFeeds()
        }
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func bind() {
        viewModel
            .$feeds
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = viewModel.feeds[indexPath.row]
        Task {
            try await viewModel.unsaveFeed(feed)
        }
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feed = viewModel.feeds[indexPath.row]
        
        switch feed {
        case .image(let imageFeed):
            let cell: ImageCell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier) as? ImageCell ?? ImageCell()
            cell.configUI(imageFeed)
            return cell
        case .text(let textFeed):
            let cell: TextCell = tableView.dequeueReusableCell(withIdentifier: TextCell.identifier) as? TextCell ?? TextCell()
            cell.configUI(textFeed)
            return cell
        }
    }
}
