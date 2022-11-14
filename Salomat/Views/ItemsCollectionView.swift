//
//  ItemsCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 02/09/22.
//

import UIKit
import SkeletonView

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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product?.prods_of_the_day?.count ?? 0
    }
   
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return MedicinesCollectionViewCell.identifier
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MedicinesCollectionViewCell.identifier, for: indexPath) as! MedicinesCollectionViewCell
        var data = product?.prods_of_the_day?[indexPath.row]
        cell.id = data?.id ?? ""
        cell.is_favorite = ((data?.is_favorite) != nil)
        cell.titleMedicine = data?.product_name ?? ""
        cell.images = data?.product_pic ?? ""
        cell.prices = data?.product_price ?? ""
        cell.title.text = data?.product_name ?? ""
        let url = "http://salomat.colibri.tj/upload_product/"
        let completeURL = url + (data?.product_pic ?? "")
        cell.image.downloaded(from: completeURL)
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
        cell.price.text = (data?.product_price)! + " сом."
        cell.is_favorite = ((data?.is_favorite) != nil)
        cell.id = data?.id ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.1 * 0.92, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MedicineViewController()
        vc.id = product?.prods_of_the_day?[indexPath.row].id ?? ""
        self.navigationController.pushViewController(vc, animated: true)
    }
}

