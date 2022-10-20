//
//  SafetyViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 05/10/22.
//

import UIKit

class SafetyViewController: UIViewController {
    
    lazy var password: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите новый пароль"
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
    
    lazy var repeatPassword: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Повторите пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var repeatTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите повторно пароль"
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
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(password)
        view.addSubview(textField)
        view.addSubview(repeatPassword)
        view.addSubview(repeatTextField)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 45),
            textField.widthAnchor.constraint(equalToConstant: 330),

            repeatPassword.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            repeatPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            repeatTextField.topAnchor.constraint(equalTo: repeatPassword.bottomAnchor, constant: 10),
            repeatTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            repeatTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            repeatTextField.heightAnchor.constraint(equalToConstant: 45),
            repeatTextField.widthAnchor.constraint(equalToConstant: 330),

            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 45),
            button.widthAnchor.constraint(equalToConstant: 330)
        ])
    }
}
