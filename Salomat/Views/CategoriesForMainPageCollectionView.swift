//
//  CategoriesForMainPageCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 24/10/22.
//

import UIKit
import Kingfisher


class CategoriesForMainPageCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var selectedIndex: IndexPath?
    var navigationController: UINavigationController
    var category: Category?
    var condition: Bool = false
    var isExpanded = [Bool]()
    
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
        isExpanded = Array(repeating: false, count: category?.categories?.count ?? 0)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CategoriesForMainPageCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        category?.categories?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if condition == true {
            return (category?.categories?[section].sub_cat?.count ?? 0) + 1
        }
        return 1
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath == selectedIndex {
//            let cell = dequeueReusableCell(withReuseIdentifier: CategoriesForMainPageCollectionViewCell.identifier, for: indexPath) as! CategoriesForMainPageCollectionViewCell
//            let url = "http://slomat2.colibri.tj/img/icons/"
//            let completeURL = url + (category?.categories?[indexPath.row].icon ?? "pills.svg")
//            cell.icon.downloaded(from: completeURL)
//            cell.category.text = category?.categories?[indexPath.row].category_name ?? ""
//            cell.button.setImage(UIImage(named: "arrow"), for: .normal)
//            return cell
//        }
//        else {
//            let cell = dequeueReusableCell(withReuseIdentifier: CategoriesForMainPageCollectionViewCell.identifier, for: indexPath) as! CategoriesForMainPageCollectionViewCell
//            let url = "http://slomat2.colibri.tj/img/icons/"
//            let completeURL = url + (category?.categories?[indexPath.row].icon ?? "")
//            cell.icon.downloaded(from: completeURL)
//            cell.category.text = category?.categories?[indexPath.row].category_name ?? ""
//            cell.button.setImage(UIImage(named: "arrow"), for: .normal)
//            return cell
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CategoriesForMainPageCollectionViewCell.identifier, for: indexPath) as! CategoriesForMainPageCollectionViewCell
        if indexPath.row == 0 {
            cell.button.setImage(UIImage(named: "arrow"), for: .normal)
            cell.category.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
            cell.category.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            cell.category.text = category?.categories?[indexPath.section].category_name ?? ""
            let url = "http://slomat2.colibri.tj/img/icons/"
            let completeURL = url + (category?.categories?[indexPath.row].icon ?? "")
            //cell.icon.downloaded(from: completeURL)
            let svgUrl = URL(string: "http://slomat2.colibri.tj/img/icons/\(category?.categories?[indexPath.row].icon ?? "")")!
                   let processor = SVGProcessor(size: CGSize(width: 240, height: 43))
            //cell.icon.kf.setImage(with: URL(string: completeURL), options: [.processor(processor)])
                //imageView.kf.setImage(with: imURL, options: [.processor(SVGImgProcessor())])
//                   KingfisherManager.shared.retrieveImage(with: svgUrl, options: [.processor(processor), .forceRefresh]) {  result in
//                           switch (result){
//                               case .success(let value):
//                                   cell.icon.image = value.image
//                               case .failure(let error):
//                                   print("error", error.localizedDescription)
//                           }
//                   }

           // cell.icon.kf.setImage(with: URL(string: completeURL ))
            
        }
        else if indexPath.row > 0{
            //cell.id.text = order?[indexPath.section].products[indexPath.row - 1].id ?? ""
            cell.category.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
            cell.category.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            cell.category.text = category?.categories?[indexPath.section].sub_cat?[indexPath.row - 1].category_name ?? ""
            cell.icon.image = UIImage(named: "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 40)
    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        selectedIndex = indexPath
////        let cell = collectionView.cellForItem(at: indexPath) as? CategoriesForMainPageCollectionViewCell
////        cell?.category.text = category?.categories?[indexPath.row].sub_cat?[indexPath.row].category_name ?? ""
////        collectionView.reloadData()
//
//        let vc = CategoriesForMainPageViewController()
//        vc.id = category?.categories?[indexPath.row].id ?? ""
//        self.navigationController.pushViewController(vc, animated: true)
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if condition == true {
                condition = false
                let sections = IndexSet.init(integer: indexPath.section)
                collectionView.reloadSections(sections)
            }
            else if condition == false {
                condition = true
                let sections = IndexSet.init(integer: indexPath.section)
                collectionView.reloadSections(sections)
            }
            
        }
        else {
            print("error", category?.categories?[indexPath.section].sub_cat?[indexPath.row - 1].id ?? "")
            let vc = CategoriesForMainPageViewController()
            vc.id = category?.categories?[indexPath.section].sub_cat?[indexPath.row - 1].id ?? ""
            vc.title = category?.categories?[indexPath.section].sub_cat?[indexPath.row - 1].category_name ?? ""
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}
