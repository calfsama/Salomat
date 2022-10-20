//
//  BlogsShowCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 05/10/22.
//

import UIKit

class BlogsShowCollectionViewCell: UICollectionViewCell {
    static let identifier = "BlogsShowCollectionViewCell"
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.numberOfLines = 0
        title.text = "Какие БАДы лучше принимать во время диеты"
        title.alpha = 0.9
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var date: UILabel = {
        let date = UILabel()
        date.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        date.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        date.text = "19.09.2022"
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    lazy var share: UILabel = {
        let share = UILabel()
        share.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        share.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        share.text = "Поделиться"
        share.translatesAutoresizingMaskIntoConstraints = false
        return share
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        subtitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        subtitle.numberOfLines = 0
        subtitle.alpha = 0.9
        subtitle.lineBreakMode = .byWordWrapping
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    func configureConstraints() {
        contentView.addSubview(title)
        contentView.addSubview(date)
        contentView.addSubview(share)
        contentView.addSubview(image)
        contentView.addSubview(subtitle)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            date.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 32),
            date.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),

            share.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 33),
            share.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            image.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 16),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 360),
            image.heightAnchor.constraint(equalToConstant: 200),

            subtitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            subtitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            subtitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
