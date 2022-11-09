//
//  ReceiptViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit
import Photos

class ReceiptViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var messengerCollectionView = MessangerCollectionView()
    var receiptCollectionView = ReceiptCollectionView()
    var imagePickerController = UIImagePickerController()
    
    
    lazy var choosePhoto: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image 2"), for: .normal)
        button.addTarget(self, action: #selector(camera), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var photo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var photoCamera: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var chooseThePhoto: UILabel = {
        let label = UILabel()
        label.text = "Выберите фото рецепта для отправки на расшифровку:"
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.setTitle("Отправить рецепт", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
//        button.addTarget(self, action: #selector(gallery), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var or: UILabel = {
        let label = UILabel()
        label.text = "или"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sendPhoto: UILabel = {
        let label = UILabel()
        label.text = "отправить фото рецепта по мессенджеру"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView2: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermissions()
        view.backgroundColor = .white
        navigationItem.title = "Электронный рецепт"
        messengerCollectionView.set(cell: Messenger.items())
        configureConstraints()
    }

    func configureConstraints() {
        view.addSubview(chooseThePhoto)
        //view.addSubview(receiptCollectionView)
        view.addSubview(button)
        view.addSubview(messengerCollectionView)
        view.addSubview(sendPhoto)
        view.addSubview(or)
        view.addSubview(uiView)
        view.addSubview(uiView2)
        view.addSubview(photo)
        view.addSubview(choosePhoto)
        view.addSubview(photoCamera)

        NSLayoutConstraint.activate([
            chooseThePhoto.topAnchor
                .constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            chooseThePhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            chooseThePhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            photo.topAnchor.constraint(equalTo: chooseThePhoto.bottomAnchor, constant: 25),
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            photo.heightAnchor.constraint(equalToConstant: 80),
            photo.widthAnchor.constraint(equalToConstant: 80),

            photoCamera.topAnchor.constraint(equalTo: chooseThePhoto.bottomAnchor, constant: 25),
            photoCamera.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            photoCamera.heightAnchor.constraint(equalToConstant: 80),
            photoCamera.widthAnchor.constraint(equalToConstant: 80),

            choosePhoto.topAnchor.constraint(equalTo: chooseThePhoto.bottomAnchor, constant: 25),
            choosePhoto.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
            choosePhoto.heightAnchor.constraint(equalToConstant: 80),
            choosePhoto.widthAnchor.constraint(equalToConstant: 80),

//            receiptCollectionView.topAnchor.constraint(equalTo: chooseThePhoto.bottomAnchor, constant: 25),
//            receiptCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            receiptCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            receiptCollectionView.heightAnchor.constraint(equalToConstant: 100),

            button.topAnchor.constraint(equalTo: choosePhoto.bottomAnchor, constant: 25),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 45),

            or.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 25),
            or.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            or.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            uiView.centerYAnchor.constraint(equalTo: or.centerYAnchor),
            uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            uiView.trailingAnchor.constraint(equalTo: or.leadingAnchor, constant: -5),
            uiView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2 * 0.84),
            uiView.heightAnchor.constraint(equalToConstant: 0.7),

            uiView2.centerYAnchor.constraint(equalTo: or.centerYAnchor),
            uiView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            uiView2.leadingAnchor.constraint(equalTo: or.trailingAnchor, constant: 5),
            uiView2.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2 * 0.84),
            uiView2.heightAnchor.constraint(equalToConstant: 0.7),

            messengerCollectionView.topAnchor.constraint(equalTo: or.bottomAnchor, constant: 25),
            messengerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            messengerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            messengerCollectionView.heightAnchor.constraint(equalToConstant: 70),

            sendPhoto.topAnchor.constraint(equalTo: messengerCollectionView.bottomAnchor, constant: 20),
            sendPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sendPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

        ])
    }

    @objc func camera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    @objc func gallery() {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }

    func checkPermissions() {
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in()
            })
        }
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
        }
        else {
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
    }

    func requestAuthorizationHandler(status: PHAuthorizationStatus) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            print("Access granted to use Photo Library")
        }
        else {
            print("We don't use access to your Photos")
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker.sourceType == .photoLibrary {
            photoCamera.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
        else {
            photo.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

