//
//  ProductDescriptionCollectionReusableView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 31/01/23.
//

import UIKit

class ProductDescriptionCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProductDescriptionCollectionReusableView"
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    func configureConstraints() {
        addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
