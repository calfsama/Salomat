//
//  InfoAboutDeliveryCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 14/10/22.
//

import UIKit

class InfoAboutDeliveryCollectionViewCell: UICollectionViewCell {
    static let identifier = "InfoAboutDeliveryCollectionViewCell"
    
    lazy var total: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1)
        configureConstraints()
    }
    
    func configureConstraints() {
        contentView.addSubview(total)
        contentView.addSubview(totalCount)
        
        NSLayoutConstraint.activate([
            total.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            total.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            totalCount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            totalCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
