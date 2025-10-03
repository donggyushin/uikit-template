//
//  TextCell.swift
//  uikit-template
//
//  Created by 신동규 on 10/3/25.
//

import Foundation
import UIKit
import SnapKit

final class TextCell: UITableViewCell {
    static let identifier = "TextCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(savedIndicator)

        savedIndicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(savedIndicator.snp.leading).inset(8)
        }
    }

    func configUI(_ feed: TextFeed) {
        titleLabel.text = feed.text
        savedIndicator.isHidden = !feed.saved
    }
}
