//
//  GoodsCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 14/10/22.
//

import UIKit

class GoodsCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var data = [Basket]()
    var cell = [Medical]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(GoodsCollectionViewCell.self, forCellWithReuseIdentifier: GoodsCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    func set(cells: [Medical]) {
        self.cell = cells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension GoodsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GoodsCollectionViewCell.identifier, for: indexPath) as! GoodsCollectionViewCell
        cell.medical.text = data[indexPath.row].title ?? "" + " сомон"
        cell.amount.text = "1шт"
        cell.price.text = (self.data[indexPath.row].price ?? "") + " сомон"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height / 2 * 0.6)
    }
}
