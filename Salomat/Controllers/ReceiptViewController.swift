//
//  ReceiptViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit
import Photos

class ReceiptViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    var receiptCollectionView = ReceiptCollectionView()
    var imagePickerController = UIImagePickerController()
    
    var imagesArray: [UIImage] = [
    UIImage(named: "image 6")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //checkPermissions()
        hideKeyboardWhenTappedAround()
        view.backgroundColor = .white
        receiptCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        receiptCollectionView.register(ReceiptCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ReceiptCollectionReusableView.identifier)
        receiptCollectionView.register(ReceiptHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReceiptHeaderCollectionReusableView.identifier)
        receiptCollectionView.delegate = self
        receiptCollectionView.dataSource = self
        navigationItem.title = "Электронный рецепт"
       
        configureConstraints()
    }

    func configureConstraints() {
        view.addSubview(receiptCollectionView)

        NSLayoutConstraint.activate([

            receiptCollectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            receiptCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            receiptCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    @objc func gallery() {
        self.imagePickerController.sourceType = .photoLibrary
        self.imagePickerController.allowsEditing = true
        self.imagePickerController.delegate = self
        self.present(self.imagePickerController, animated: true, completion: nil)
    }

//    func checkPermissions() {
//        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
//            PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in()
//            })
//        }
//        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
//        }
//        else {
//            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
//        }
//    }
//
//    func requestAuthorizationHandler(status: PHAuthorizationStatus) {
//        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
//            print("Access granted to use Photo Library")
//        }
//        else {
//            print("We don't use access to your Photos")
//        }
//    }
//

}
extension ReceiptViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        if indexPath.row >= 1 {
            cell.photo.layer.borderColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1).cgColor
            cell.photo.layer.borderWidth = 1
            cell.cancelButton.layer.setValue(indexPath.row, forKey: "index")
            cell.cancelButton.addTarget(self, action: #selector(deleteUser), for: .touchUpInside)
            cell.cancelButton.setImage(UIImage(named: "cancel"), for: .normal)
        }
        else if indexPath.row == 0 {
            cell.cancelButton.layer.setValue(indexPath.row, forKey: "index")
            cell.cancelButton.addTarget(self, action: #selector(empty), for: .touchUpInside)
            cell.cancelButton.setImage(UIImage(named: ""), for: .normal)
            cell.photo.layer.borderWidth = 0
        }
        cell.photo.layer.cornerRadius = 4
        cell.photo.layer.masksToBounds = true
        cell.photo.image = imagesArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReceiptHeaderCollectionReusableView.identifier, for: indexPath) as! ReceiptHeaderCollectionReusableView
            header.configure()
            return header
            
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ReceiptCollectionReusableView.identifier, for: indexPath) as! ReceiptCollectionReusableView
            return footer
            
        default:
            
            assert(false, "Unexpected element kind")
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 55)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 3 * 0.8  , height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            gallery()
        }
    }
    
    @objc func deleteUser(sender:UIButton) {
        let i : Int = (sender.layer.value(forKey: "index")) as! Int
        let objectToDelete = imagesArray.remove(at: i)
        receiptCollectionView.reloadData()
    }
    
    @objc func empty() {
        
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            for i in 1...6 {
//                imagesArray += [pickedimage]
//            }
            imagesArray += [pickedimage]//Will store three selected images in your array
            print("hello", pickedimage.pngData())
            receiptCollectionView.reloadData()
        }
        else {
            print("something went wrong...")
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


