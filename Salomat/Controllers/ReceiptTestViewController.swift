//
//  ReceiptTestViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 05/12/22.
//

import UIKit

class ReceiptTestViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    var receipt = ReceiptCollectionView()
    var imagePicker = UIImagePickerController()
    var imageArray = [UIImage]()
    var receiptImage: Image?
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.setTitle("Отправить рецепт", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.addTarget(self, action: #selector(gallery), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        receipt.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        receipt.register(ReceiptCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ReceiptCollectionReusableView.identifier)
        receipt.register(ChoosePhotoCollectionViewCell.self, forCellWithReuseIdentifier: ChoosePhotoCollectionViewCell.identifier)
        receipt.delegate = self
        receipt.dataSource = self
        navigationItem.title = "Электронный рецепт"
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(receipt)
        view.addSubview(button)
        receipt.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            receipt.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            receipt.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            receipt.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            receipt.heightAnchor.constraint(equalToConstant: 100),
            
            button.topAnchor.constraint(equalTo: receipt.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc func gallery() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func camera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}
extension ReceiptTestViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath)as! PhotoCollectionViewCell
        if indexPath.row == imageArray.count  {
            cell.photo.image = imageArray[indexPath.row]
        }
        else {
            print("error")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 3 * 0.8, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            gallery()
            print("camera")
        }
        print("empty")
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let pickedimage = (info[UIImagePickerController.InfoKey.editedImage.rawValue] as? UIImage){
//            imageArray = [pickedimage]//Will store three selected images in your array
//            print("hello", pickedimage.pngData())
//            receipt.reloadData()
//        }
//        else {
//            print("something went wrong...")
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
    
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
//          self.dismiss(animated: true, completion: { () -> Void in
//
//          })
//        imageArray = [image]
//        print("hello", image.pngData())
//      }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage  {
            imageArray = [image]
            receipt.reloadData()
            print("hhhh", image.pngData())
        }
        else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
    }
}
