//
//  ItemsCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 02/09/22.
//

import UIKit
import SkeletonView
import Kingfisher

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class ItemsCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var navigationController: UINavigationController
    var data = [DataModel]()
    var product: ProdsOfTheDay?
    var favorites: FavoritesData?
    
    init(nav: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.navigationController = nav as! UINavigationController
        super.init(frame: .zero, collectionViewLayout: layout)
        register(MedicinesCollectionViewCell.self, forCellWithReuseIdentifier: MedicinesCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 16
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        showsHorizontalScrollIndicator = false
        backgroundColor = .white
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ItemsCollectionView: UICollectionViewDelegate, SkeletonCollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return MedicinesCollectionViewCell.identifier
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product?.prods_of_the_day?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MedicinesCollectionViewCell.identifier, for: indexPath) as! MedicinesCollectionViewCell
        let data = product?.prods_of_the_day?[indexPath.row]
        cell.image.image = UIImage(named: "Image")
        cell.title.text = "okfojfjojf"
        cell.id = data?.id ?? ""
        cell.is_favorite = ((data?.is_favorite) != nil)
        cell.titleMedicine = data?.product_name ?? ""
        cell.images = data?.product_pic ?? ""
        cell.prices = data?.product_price ?? ""
        cell.title.text = data?.product_name ?? ""
        cell.totalCount.text = data?.total_count_in_store ?? ""
        let url = "http://slomat2.colibri.tj/upload_product/"
        let completeURL = url + (data?.product_pic ?? "")
       // cell.image.downloaded(from: completeURL)
//        if Int(data?.total_count_in_store ?? "")! <= 0 {
//            cell.cartButton.backgroundColor = .white
//            cell.cartButton.setTitle("Нет в наличии", for: .normal)
//            cell.cartButton.setTitleColor(UIColor(red: 0.937, green: 0.365, blue: 0.439, alpha: 1), for: .normal)
//            cell.cartButton.addTarget(self, action: #selector(empty), for: .touchUpInside)
//        }
//        else if Int(data?.total_count_in_store ?? "")! > 0 {
//            cell.cartButton.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
//            cell.cartButton.setTitle("В корзину", for: .normal)
//            cell.cartButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//        }
        cell.configureConstraints()
        cell.image.kf.indicatorType = .activity
        cell.image.kf.setImage(with: URL(string: completeURL))
        //cell.image.image = UIImage(named: "123")
        if data?.is_favorite == true {
            cell.button.setImage(UIImage(named: "heart"), for: .normal)
        }
        else  {
            cell.button.setImage(UIImage(named: "favorite"), for: .normal)
        }

//        if data?.is_favorite == false {
//            cell.button.setImage(UIImage(named: "favorite"), for: .normal)
//        }
//        else if data?.is_favorite == true{
//            cell.button.setImage(UIImage(named: "heart"), for: .normal)
//        }
        cell.titleMedicine = data?.product_name ?? ""
        cell.prices = data?.product_price ?? ""
        cell.images = data?.product_pic ?? ""
        cell.price.text = (data?.product_price) ?? "" + " сом."
        cell.is_favorite = ((data?.is_favorite) != nil)
        cell.id = data?.id ?? ""
        //cell.contentView.hideSkeleton()
        return cell
    }
    
    @objc func empty() {
        print("don't work")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.1 * 0.92, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = AboutProductViewController()
        vc.title = product?.prods_of_the_day?[indexPath.row].product_name ?? ""
        vc.id = product?.prods_of_the_day?[indexPath.row].id ?? ""
        self.navigationController.pushViewController(vc, animated: true)
    }
}

