//
//  ProductDescriptionCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 31/01/23.
//

import UIKit

class ProductDescriptionCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var productShow: ProductsShow?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(ProductDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: ProductDescriptionCollectionViewCell.identifier)
        register(ProductDescriptionCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ProductDescriptionCollectionReusableView.identifier)
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ProductDescriptionCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ProductDescriptionCollectionViewCell.identifier, for: indexPath) as! ProductDescriptionCollectionViewCell
        cell.productDescription.attributedText = productShow?.product?.product_about?.html2Attributed
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ProductDescriptionCollectionReusableView.identifier, for: indexPath) as! ProductDescriptionCollectionReusableView
        footer.image.image = UIImage(named: "Important info")
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
