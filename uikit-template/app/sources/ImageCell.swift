//
//  ImageCell.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

final class ImageCell: UITableViewCell {
    static let identifier = "ImageCell"
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let savedIndicator: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bookmark.fill")
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(image)
        contentView.addSubview(savedIndicator)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        savedIndicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configUI(_ feed: ImageFeed) {
        image.kf.setImage(with: feed.url)
        savedIndicator.isHidden = !feed.saved    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
}
