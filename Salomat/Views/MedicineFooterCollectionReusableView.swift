//
//  MedicineFooterCollectionReusableView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 21/10/22.
//

import UIKit

class MedicineFooterCollectionReusableView: UICollectionReusableView {
    static let identifier = "MedicineFooterCollectionReusableView"
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Group 32")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public func configure() {
        addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        
        ])
    }
}
