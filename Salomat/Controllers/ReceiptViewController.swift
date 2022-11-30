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
    var instruction = InstructionCollectionView()
    
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
        label.numberOfLines = 2
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
        button.addTarget(self, action: #selector(camera), for: .touchUpInside)
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
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Телефон"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя и фамилия"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Комментарий"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        //checkPermissions()
        view.backgroundColor = .white
        
        navigationItem.title = "Электронный рецепт"
        messengerCollectionView.set(cell: Messenger.items())
        instruction.set(cells: Instruction.items())
       
        configureConstraints()
    }

    func configureConstraints() {
        view.addSubview(chooseThePhoto)
        view.addSubview(receiptCollectionView)
////        view.addSubview(photo)
//        view.addSubview(button)
//        view.addSubview(messengerCollectionView)
//        view.addSubview(sendPhoto)
//        view.addSubview(or)
//        view.addSubview(uiView)
//        view.addSubview(uiView2)
//        uiScrollView.addSubview(photo)
//        view.addSubview(choosePhoto)
//        view.addSubview(instruction)

        NSLayoutConstraint.activate([
            chooseThePhoto.topAnchor
                .constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            chooseThePhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            chooseThePhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            receiptCollectionView.topAnchor.constraint(equalTo: chooseThePhoto.bottomAnchor, constant: 25),
            receiptCollectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            receiptCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            
//
////            choosePhoto.topAnchor.constraint(equalTo: chooseThePhoto.bottomAnchor, constant: 25),
////            choosePhoto.leadingAnchor.constraint(equalTo: receiptCollectionView.trailingAnchor, constant: 16),
////            choosePhoto.heightAnchor.constraint(equalToConstant: 80),
////            choosePhoto.widthAnchor.constraint(equalToConstant: 80),
//
//            button.topAnchor.constraint(equalTo: receiptCollectionView.bottomAnchor, constant: 25),
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
////            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.heightAnchor.constraint(equalToConstant: 45),
//
//            or.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 25),
//            or.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            or.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//
//            uiView.centerYAnchor.constraint(equalTo: or.centerYAnchor),
//            uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
////            uiView.trailingAnchor.constraint(equalTo: or.leadingAnchor, constant: -5),
//            uiView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2 * 0.84),
//            uiView.heightAnchor.constraint(equalToConstant: 0.7),
//
//            uiView2.centerYAnchor.constraint(equalTo: or.centerYAnchor),
//            uiView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
////            uiView2.leadingAnchor.constraint(equalTo: or.trailingAnchor, constant: 5),
//            uiView2.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2 * 0.84),
//            uiView2.heightAnchor.constraint(equalToConstant: 0.7),
//
//            messengerCollectionView.topAnchor.constraint(equalTo: or.bottomAnchor, constant: 25),
//            messengerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            messengerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            messengerCollectionView.heightAnchor.constraint(equalToConstant: 70),
//
//            sendPhoto.topAnchor.constraint(equalTo: messengerCollectionView.bottomAnchor, constant: 20),
//            sendPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            sendPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//
////            instruction.topAnchor.constraint(equalTo: sendPhoto.bottomAnchor, constant: 20),
////            instruction.widthAnchor.constraint(equalToConstant: view.frame.size.width),
////            instruction.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
    
    @objc func openInstagram() {
//        guard let url = URL(string: "instagram://>") else { return }
//
//        if UIApplication.shared.canOpenURL(url) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
//        else {
//            print("error")
//        }
        let instagramHooks = "https://t.me/hoosniya"
        let instagramUrl = URL(string: instagramHooks)!
        if UIApplication.shared.canOpenURL(instagramUrl)
        {
            UIApplication.shared.open(instagramUrl)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(URL(string: "http://instagram.com/")!)
        }
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedimage = (info[UIImagePickerController.InfoKey.editedImage] as? UIImage){
            receiptCollectionView.imagesArray = [pickedimage]//Will store three selected images in your array
            print("hello", pickedimage.pngData())
            receiptCollectionView.reloadData()
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

