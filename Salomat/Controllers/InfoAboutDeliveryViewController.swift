//
//  InfoAboutDeliveryViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 13/10/22.
//

import UIKit

class InfoAboutDeliveryViewController: UIViewController {
    
    lazy var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView2: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView3: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.text = "Имя Фамилия"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    lazy var phone: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Номер телефона"
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    lazy var additionalPhone: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Телефон, если мы не дозвонимся"
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var additionalPTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    lazy var street: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Улица"
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var streetTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    lazy var house: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Дом"
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var houseTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    lazy var referencePoint: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Ориентир"
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var referencePointTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    lazy var comments: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "Комментарии"
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var commentsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.layer.cornerRadius = 4
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureConstraints()
        
    }
    
    func configureConstraints() {
        view.addSubview(uiView)
        view.addSubview(uiView2)
        view.addSubview(uiView3)
        view.addSubview(name)
        view.addSubview(nameTextField)
        view.addSubview(phone)
        view.addSubview(phoneTextField)
        view.addSubview(additionalPhone)
        view.addSubview(additionalPTextField)
        view.addSubview(street)
        view.addSubview(streetTextField)
        view.addSubview(house)
        view.addSubview(houseTextField)
        view.addSubview(referencePoint)
        view.addSubview(referencePointTextField)
        view.addSubview(comments)
        view.addSubview(commentsTextField)
        view.addSubview(button)
        
        
        NSLayoutConstraint.activate([
            
            uiView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            uiView.heightAnchor.constraint(equalToConstant: 3),
            uiView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
            
            uiView2.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            uiView2.leadingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: 11),
            uiView2.heightAnchor.constraint(equalToConstant: 3),
            uiView2.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
            
            uiView3.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            uiView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            uiView3.heightAnchor.constraint(equalToConstant: 3),
            uiView3.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
            
            name.topAnchor.constraint(equalTo: uiView.bottomAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            phone.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            phone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            phoneTextField.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 10),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            phoneTextField.heightAnchor.constraint(equalToConstant: 45),
            
            additionalPhone.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 15),
            additionalPhone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            additionalPTextField.topAnchor.constraint(equalTo: additionalPhone.bottomAnchor, constant: 10),
            additionalPTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            additionalPTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            additionalPTextField.heightAnchor.constraint(equalToConstant: 45),
            
            street.topAnchor.constraint(equalTo: additionalPTextField.bottomAnchor, constant: 15),
            street.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            streetTextField.topAnchor.constraint(equalTo: street.bottomAnchor, constant: 10),
            streetTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            streetTextField.trailingAnchor.constraint(equalTo: houseTextField.leadingAnchor, constant: -10),
            streetTextField.heightAnchor.constraint(equalToConstant: 45),
            
            house.topAnchor.constraint(equalTo: additionalPTextField.bottomAnchor, constant: 15),
            house.leadingAnchor.constraint(equalTo: streetTextField.trailingAnchor, constant: 10),
            
            houseTextField.topAnchor.constraint(equalTo: house.bottomAnchor, constant: 10),
            houseTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            houseTextField.widthAnchor.constraint(equalToConstant: 55),
            houseTextField.heightAnchor.constraint(equalToConstant: 45),
            
            referencePoint.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 15),
            referencePoint.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            referencePointTextField.topAnchor.constraint(equalTo: referencePoint.bottomAnchor, constant: 10),
            referencePointTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            referencePointTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            referencePointTextField.heightAnchor.constraint(equalToConstant: 45),
            
            comments.topAnchor.constraint(equalTo: referencePointTextField.bottomAnchor, constant: 15),
            comments.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            commentsTextField.topAnchor.constraint(equalTo: comments.bottomAnchor, constant: 10),
            commentsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            commentsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            commentsTextField.heightAnchor.constraint(equalToConstant: 65),
            
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 45),
            
        
        ])
    }
    
    @objc func buttonAction() {
        let vc = InfoAboutDeliveryTwoViewController()
        vc.title = "Информация о доставке"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
