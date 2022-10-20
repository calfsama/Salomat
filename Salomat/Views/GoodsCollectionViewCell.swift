//
//  GoodsCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 14/10/22.
//

import UIKit

class GoodsCollectionViewCell: UICollectionViewCell {
    static let identifier = "GoodsCollectionViewCell"
    
    lazy var medical: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var amount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    func configureConstraints() {
        contentView.addSubview(medical)
        contentView.addSubview(amount)
        contentView.addSubview(price)
        
        NSLayoutConstraint.activate([
            medical.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            medical.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amount.centerXAnchor.constraint(equalTo: medical.trailingAnchor, constant: 20),
            
            price.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }   
}
