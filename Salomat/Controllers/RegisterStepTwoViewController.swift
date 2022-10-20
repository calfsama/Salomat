//
//  RegisterStepTwoViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/10/22.
//

import UIKit

class RegisterStepTwoViewController: UIViewController {
    
    lazy var password: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
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
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.text = "Повторный пароль"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var repeatTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
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
    
    
    lazy var cancel: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = .white
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1), for: .normal)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var register: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var agree: UILabel = {
        let label = UILabel()
        label.text = "Нажав на кнопку “Продолжить”, я принимаю"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor =  UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var usl: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1), for: .normal)
        button.setTitle("условия пользования", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
        view.addSubview(cancel)
        view.addSubview(register)
        view.addSubview(agree)
        view.addSubview(usl)
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 45),
            textField.widthAnchor.constraint(equalToConstant: 330),
            
            repeatPassword.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            repeatPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            repeatTextField.topAnchor.constraint(equalTo: repeatPassword.bottomAnchor,constant: 5),
            repeatTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            repeatTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            repeatTextField.heightAnchor.constraint(equalToConstant: 45),
            repeatTextField.widthAnchor.constraint(equalToConstant: 330),
            
            agree.topAnchor.constraint(equalTo: repeatTextField.bottomAnchor, constant: 350),
            agree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            agree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usl.topAnchor.constraint(equalTo: agree.bottomAnchor),
            usl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cancel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            cancel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cancel.heightAnchor.constraint(equalToConstant: 45),
            cancel.widthAnchor.constraint(equalToConstant: 160),
            
            register.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            register.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            register.leadingAnchor.constraint(equalTo: cancel.trailingAnchor, constant: 16),
            register.heightAnchor.constraint(equalToConstant: 45),
            register.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    @objc func buttonAction() {
        let vc = ProfileInfoViewController()
        vc.title = "Профиль"
        navigationController?.pushViewController(vc, animated: true)
    }
}
