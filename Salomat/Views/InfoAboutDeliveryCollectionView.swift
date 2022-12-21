//
//  InfoAboutDeliveryCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 14/10/22.
//

import UIKit

class InfoAboutDeliveryCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var price: String = ""

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(InfoAboutDeliveryCollectionViewCell.self, forCellWithReuseIdentifier: InfoAboutDeliveryCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension InfoAboutDeliveryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: InfoAboutDeliveryCollectionViewCell.identifier, for: indexPath) as! InfoAboutDeliveryCollectionViewCell
        cell.total.text = "Промежуточный итог"
        //cell.totalCount.text = "\(price) сомон"
        print(price, "ksnck")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
