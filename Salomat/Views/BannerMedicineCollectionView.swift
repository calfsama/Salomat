//
//  BannerMedicineCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 15/09/22.
//

import UIKit

class BannerMedicineCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var navigationController: UINavigationController
    var banner: CategoriesForMainPage?
    
    init(nav: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.navigationController = nav as! UINavigationController
        super.init(frame: .zero, collectionViewLayout: layout)
        register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layout.minimumLineSpacing = 16
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension BannerMedicineCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banner?.categories_for_main_page?[0].categ_slider?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as! BannerCollectionViewCell
        if ((banner?.categories_for_main_page?[1]) != nil) {
            let url = "http://salomat.colibri.tj/upload_banner/"
            let completeURL = url + (banner?.categories_for_main_page?[0].categ_slider?[indexPath.row].slider_pic ?? "")
            cell.image.downloaded(from: completeURL)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width * 0.92, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MedicineViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }

}
