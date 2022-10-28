//
//  MyOrdersCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 14/10/22.
//

import UIKit

class MyOrdersCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var medical = [Medical]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(MyOrdersCollectionViewCell.self, forCellWithReuseIdentifier: MyOrdersCollectionViewCell.identifier)
        register(MyOrdersHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyOrdersHeaderCollectionReusableView.identifier)
        register(MyOrdersCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MyOrdersCollectionReusableView.identifier)
        delegate = self
        dataSource = self
        layout.minimumLineSpacing = 0
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cell: [Medical]) {
        self.medical = cell
    }
    
}
extension MyOrdersCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MyOrdersCollectionViewCell.identifier, for: indexPath) as! MyOrdersCollectionViewCell
        cell.image.image = medical[indexPath.row].image
        cell.medical.text = medical[indexPath.row].name
        cell.price.text = medical[indexPath.row].price + " сом"
//        cell.image.image = UIImage(named: "123")
//        cell.medical.text = "Линкас сироп 50 мл"
//        cell.price.text = "100 сом."
        cell.count.text = "1 шт"
        cell.art.text = "Арт. 10120"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MyOrdersCollectionReusableView.identifier, for: indexPath) as! MyOrdersCollectionReusableView
            footer.configure()
            return footer
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyOrdersHeaderCollectionReusableView.identifier, for: indexPath) as! MyOrdersHeaderCollectionReusableView
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 150)
    }
}
