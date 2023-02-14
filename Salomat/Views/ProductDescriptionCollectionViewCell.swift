//
//  ProductDescriptionCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 31/01/23.
//

import UIKit

class ProductDescriptionCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductDescriptionCollectionViewCell"
    
    lazy var analogScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = contentView.bounds
        scroll.showsVerticalScrollIndicator = false
       // scroll.contentSize = CGSize(width: contentView.frame.size.width, height: 1200)
        scroll.backgroundColor = .white
        return scroll
    }()
    
    lazy var productDescription: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.text = "Антацидный препарат, представляющий собой сбалансированную комбинацию алгелдрата (алюминия гидроксида) и магния гидроксида..."
        label.numberOfLines = 0
//        label.setNeedsDisplay()
        label.alpha = 0.9
        label.lineBreakMode = .byWordWrapping
       // label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(analogScroll)
        configureConstraints()
    }
    
    func configureConstraints() {
        analogScroll.addSubview(productDescription)
        
        NSLayoutConstraint.activate([
            productDescription.topAnchor.constraint(equalTo: analogScroll.topAnchor),
            productDescription.leadingAnchor.constraint(equalTo: analogScroll.leadingAnchor, constant: 16),
            productDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            productDescription.bottomAnchor.constraint(equalTo: analogScroll.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
