//
//  ReceiptCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 27/10/22.
//

import UIKit

class ReceiptCollectionView: UICollectionView {
    
//    var imagesArray = [UIImage]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
//        register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
//        register(ReceiptCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ReceiptCollectionReusableView.identifier)
//        register(ChoosePhotoCollectionViewCell.self, forCellWithReuseIdentifier: ChoosePhotoCollectionViewCell.identifier)
//        delegate = self
//        dataSource = self
        //layout.minimumLineSpacing = 10
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//extension ReceiptCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imagesArray.count + 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.row == 0   {
//            let vc = ReceiptViewController()
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoosePhotoCollectionViewCell.identifier, for: indexPath) as! ChoosePhotoCollectionViewCell
//            cell.button.setImage(UIImage(named: "image 2"), for: .normal)
//            DispatchQueue.main.async {
//                cell.button.addTarget(self, action: #selector(vc.camera), for: .touchUpInside)
//            }
//            return cell
//        }
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
//        cell.photo.image = imagesArray[indexPath.row]
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ReceiptCollectionReusableView.identifier, for: indexPath) as! ReceiptCollectionReusableView
//        return footer
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        if imagesArray.count == 0 {
//            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
//        }
//        return CGSize(width: 0, height: 0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.size.width / 3 * 0.94, height: 100)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            let vc = ReceiptViewController()
//            vc.camera()
//            print("camera")
//        }
//        print("library")
//    }
//
////    @objc func camera() {
////        print("clicked")
////    }
//
//}
