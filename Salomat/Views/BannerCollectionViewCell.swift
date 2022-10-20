//
//  BannerCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 02/09/22.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    static let identifier = "BannerCollectionViewCell"
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    func configureConstraints() {
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
