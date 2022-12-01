//
//  ReceiptCollectionReusableView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 29/11/22.
//

import UIKit

class ReceiptCollectionReusableView: UICollectionReusableView {
    static let identifier = "ReceiptCollectionReusableView"
    var messangerButton = MessangerCollectionView()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.setTitle("Отправить рецепт", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        //button.addTarget(self, action: #selector(), for: .touchUpInside)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        messangerButton.set(cell: Messenger.items())
        configureConstraints()
    }
    
    func configureConstraints() {
        
        addSubview(phoneTextField)
        addSubview(nameTextField)
        addSubview(commentTextField)
        addSubview(button)
        addSubview(or)
        addSubview(uiView)
        addSubview(uiView2)
        addSubview(messangerButton)
        addSubview(sendPhoto)
        
        
        NSLayoutConstraint.activate([
            
            phoneTextField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            phoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            phoneTextField.heightAnchor.constraint(equalToConstant: 45),
            
            nameTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            commentTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            commentTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            commentTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            commentTextField.heightAnchor.constraint(equalToConstant: 80),
        
            button.topAnchor.constraint(equalTo: commentTextField.bottomAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 45),

            or.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 25),
            or.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            or.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            uiView.centerYAnchor.constraint(equalTo: or.centerYAnchor),
            uiView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            uiView.trailingAnchor.constraint(equalTo: or.leadingAnchor, constant: -5),
            uiView.widthAnchor.constraint(equalToConstant: frame.size.width / 2 * 0.84),
            uiView.heightAnchor.constraint(equalToConstant: 0.7),

            uiView2.centerYAnchor.constraint(equalTo: or.centerYAnchor),
            uiView2.trailingAnchor.constraint(equalTo: trailingAnchor),
//            uiView2.leadingAnchor.constraint(equalTo: or.trailingAnchor, constant: 5),
            uiView2.widthAnchor.constraint(equalToConstant: frame.size.width / 2 * 0.84),
            uiView2.heightAnchor.constraint(equalToConstant: 0.7),

            messangerButton.topAnchor.constraint(equalTo: or.bottomAnchor, constant: 25),
            messangerButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            messangerButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            messangerButton.heightAnchor.constraint(equalToConstant: 70),

            sendPhoto.topAnchor.constraint(equalTo: messangerButton.bottomAnchor, constant: 20),
            sendPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sendPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
