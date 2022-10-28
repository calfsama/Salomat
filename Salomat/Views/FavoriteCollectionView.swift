//
//  FavoriteCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 17/10/22.
//

import UIKit

class FavoriteCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var data = [DataModel]()
    var navigationController: UINavigationController

    init(nav: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.navigationController = nav as! UINavigationController
        super.init(frame: .zero, collectionViewLayout: layout)
        register(MedicinesCollectionViewCell.self, forCellWithReuseIdentifier: MedicinesCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        layout.minimumLineSpacing = 16
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FavoriteCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
        if data.count == 0 {
            image.image = UIImage(named: "Дизайн без названия-4")
            collectionView.backgroundView = image
            return 0
        }
        else {
            image.image = UIImage(named: "")
            collectionView.backgroundView = image
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MedicinesCollectionViewCell.identifier, for: indexPath) as! MedicinesCollectionViewCell
        let url = "http://salomat.colibri.tj/upload_product/"
        let completeURL = url + (data[indexPath.row].image ?? "")
        cell.id = data[indexPath.row].id ?? ""
        cell.image.downloaded(from: completeURL)
        cell.price.text = data[indexPath.row].price
        cell.title.text = data[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2.3, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MedicineViewController()
        vc.id = data[indexPath.row].id ?? ""
        navigationController.pushViewController(vc, animated: true)
    }
}
