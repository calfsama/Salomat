//
//  BasketCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 10/10/22.
//

import UIKit

class BasketCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var medical = [Medical]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(BasketCollectionViewCell.self, forCellWithReuseIdentifier: BasketCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        layout.minimumLineSpacing = 0
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(cells: [Medical]) {
        self.medical = cells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension BasketCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: BasketCollectionViewCell.identifier, for: indexPath) as! BasketCollectionViewCell
        cell.image.image = medical[indexPath.row].image
        cell.title.text = medical[indexPath.row].name
        cell.price.text = medical[indexPath.row].price
        cell.ml.text = "50 мл"
        cell.art.text = "Арт. 10120"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height / 2 )
    }
}
