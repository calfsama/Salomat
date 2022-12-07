//
//  CategoriesForMainPageCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 24/10/22.
//

import UIKit

class CategoriesForMainPageCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var selectedIndex: IndexPath?
    var navigationController: UINavigationController
    var category: Category?
    
    init(nav: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.navigationController = nav as! UINavigationController
        super.init(frame: .zero, collectionViewLayout: layout)
        register(CategoriesForMainPageCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesForMainPageCollectionViewCell.identifier)
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
extension CategoriesForMainPageCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath == selectedIndex {
            let cell = dequeueReusableCell(withReuseIdentifier: CategoriesForMainPageCollectionViewCell.identifier, for: indexPath) as! CategoriesForMainPageCollectionViewCell
            let url = "http://slomat2.colibri.tj/img/icons/"
            let completeURL = url + (category?.categories?[indexPath.row].icon ?? "bandage2.png")
            cell.icon.downloaded(from: completeURL)
            cell.category.text = category?.categories?[indexPath.row].category_name ?? ""
            cell.button.setImage(UIImage(named: "arrow-right"), for: .normal)
            return cell
        }
        else {
            let cell = dequeueReusableCell(withReuseIdentifier: CategoriesForMainPageCollectionViewCell.identifier, for: indexPath) as! CategoriesForMainPageCollectionViewCell
            let url = "http://slomat2.colibri.tj/img/icons/"
            let completeURL = url + (category?.categories?[indexPath.row].icon ?? "bandage2.png")
            cell.icon.downloaded(from: completeURL)
            cell.category.text = category?.categories?[indexPath.row].category_name ?? ""
            cell.button.setImage(UIImage(named: "arrow-right"), for: .normal)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selectedIndex = indexPath
//        let cell = collectionView.cellForItem(at: indexPath) as? CategoriesForMainPageCollectionViewCell
//        cell?.category.text = category?.categories?[indexPath.row].sub_cat?[indexPath.row].category_name ?? ""
//        collectionView.reloadData()
        
        let vc = CategoriesForMainPageViewController()
        self.navigationController.pushViewController(vc, animated: true)
        
    }
}
