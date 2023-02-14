//
//  MainCategoriesCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 10/01/23.
//

import UIKit

class MainCategoriesCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var categories: CategoriesProducts?
    var navigationController: UINavigationController

    init(nav: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.navigationController = nav as! UINavigationController
        super.init(frame: .zero, collectionViewLayout: layout)
        register(MedicinesCollectionViewCell.self, forCellWithReuseIdentifier: MedicinesCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        layout.minimumLineSpacing = 16
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MainCategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.category_products?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MedicinesCollectionViewCell.identifier, for: indexPath) as! MedicinesCollectionViewCell
        cell.totalCount.text = categories?.category_products?.products[indexPath.row].total_count_in_store ?? ""
        cell.title.text = categories?.category_products?.products[indexPath.row].product_name ?? ""
        cell.id = categories?.category_products?.products[indexPath.row].id ?? ""
        cell.is_favorite = ((categories?.category_products?.products[indexPath.row].is_favorite) != nil)
        cell.titleMedicine = categories?.category_products?.products[indexPath.row].product_name ?? ""
        cell.prices = categories?.category_products?.products[indexPath.row].product_price ?? ""
        cell.images = categories?.category_products?.products[indexPath.row].product_pic ?? ""
        cell.title.text = categories?.category_products?.products[indexPath.row].product_name ?? ""
        cell.price.text = categories?.category_products?.products[indexPath.row].product_price ?? ""
        let url = "http://slomat2.colibri.tj/upload_product/"
//        if Int(categories?.category_products?.products[indexPath.row].total_count_in_store ?? "")! <= 0 {
//            cell.cartButton.backgroundColor = .white
//            cell.cartButton.setTitle("Нет в наличии", for: .normal)
//            cell.cartButton.setTitleColor(UIColor(red: 0.937, green: 0.365, blue: 0.439, alpha: 1), for: .normal)
//            cell.cartButton.addTarget(self, action: #selector(empty), for: .touchUpInside)
//        }
//        else if Int(categories?.category_products?.products[indexPath.row].total_count_in_store ?? "")! > 0 {
//            cell.cartButton.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
//            cell.cartButton.setTitle("В корзину", for: .normal)
//            cell.cartButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//        }
        let completeURL = url + (categories?.category_products?.products[indexPath.row].product_pic ?? "")
        cell.image.downloaded(from: completeURL)
        cell.configureConstraints()
        return cell
    }
    
    @objc func empty() {
        print("don't work")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2.3, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = AboutProductViewController()
        vc.title = categories?.category_products?.products[indexPath.row].product_name ?? ""
        vc.id = categories?.category_products?.products[indexPath.row].id ?? ""
        self.navigationController.pushViewController(vc, animated: true)
    }
}
