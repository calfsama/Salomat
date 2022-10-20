//
//  MedicinesCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit

class MedicinesCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var condition: Bool = false
    var cell = MedicinesCollectionViewCell()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(MedicinesCollectionViewCell.self, forCellWithReuseIdentifier: MedicinesCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 16
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MedicinesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MedicinesCollectionViewCell.identifier, for: indexPath) as! MedicinesCollectionViewCell
        cell.image.image = UIImage(named: "Image")
        cell.price.text = "50,00 c."
        cell.title.text = "Линкас сироп 90 мл от кашля"
        //cell.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2.3, height: 270)
    }
    
//    @objc func buttonAction() {
//        if condition == false {
//            condition = true
//            print("Clicked")
//            self.cell.button.setImage(UIImage(named: "heart"), for: .normal)
//        }
////        else if condition == true {
////            condition = false
////            self.cell.button.setImage(UIImage(named: "iconHeart"), for: .normal)
////        }
//
//    }
    
}
