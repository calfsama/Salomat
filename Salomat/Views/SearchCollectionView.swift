//
//  SearchCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 25/10/22.
//

import UIKit
import Kingfisher

class SearchCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var search: Search?
    var data: [Any] = []
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
extension SearchCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
        if search?.products?.count == 0 {
            emptyLabel.text = "Ничего не найдено"
            emptyLabel.textColor = .gray
            emptyLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            emptyLabel.textAlignment = NSTextAlignment.center
            collectionView.backgroundView = emptyLabel
            //collectionView.separatorStyle = .none
            return 0
        }
        else {
            emptyLabel.text = ""
            return search?.products?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MedicinesCollectionViewCell.identifier, for: indexPath) as! MedicinesCollectionViewCell
        let url = "http://slomat2.colibri.tj/upload_product/"
        let completeURL = url + (search?.products?[indexPath.row].product_pic ?? "")
        cell.image.kf.indicatorType = .activity
        cell.image.kf.setImage(with: URL(string: completeURL))
        //cell.title.text = search?.products?[indexPath.row].product_name ?? ""
        cell.title.text = "kekghg"
        cell.title.text = search?.products?[indexPath.row].product_name ?? ""
        cell.price.text = search?.products?[indexPath.row].product_price ?? ""
        cell.id = search?.products?[indexPath.row].id ?? ""
        cell.is_favorite = ((search?.products?[indexPath.row].is_favorite) != nil)
        cell.prices = search?.products?[indexPath.row].product_price ?? ""
        cell.titleMedicine = search?.products?[indexPath.row].product_name ?? ""
        cell.images = search?.products?[indexPath.row].product_pic ?? ""
        cell.totalCount.text = search?.products?[indexPath.row].total_count_in_store ?? ""
        cell.button.setImage(UIImage(named: "favorite"), for: .normal)
        cell.configureConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2.3, height: 270)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TestTwoViewController()
        vc.title = search?.products?[indexPath.row].product_name ?? ""
        vc.id = search?.products?[indexPath.row].id ?? ""
        self.navigationController.pushViewController(vc, animated: true)
    }
}
