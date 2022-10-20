//
//  PasswordViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 26/09/22.
//

import UIKit

class PasswordViewController: UIViewController {
    
    lazy var password: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.text = "Пароль"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
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
    
    lazy var signUp: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.937, green: 0.365, blue: 0.439, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitle("Забыли пароль?", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(recoveryButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.layer.cornerRadius = 4
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitle("Войти", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraints()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
    }
    
    func configureConstraints() {
        view.addSubview(password)
        view.addSubview(textField)
        view.addSubview(signUp)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 45),
            textField.widthAnchor.constraint(equalToConstant: 330),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            signUp.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 465),
            signUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUp.heightAnchor.constraint(equalToConstant: 45),
            signUp.widthAnchor.constraint(equalToConstant: 330),
            signUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            continueButton.topAnchor.constraint(equalTo: signUp.bottomAnchor, constant: 18),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.heightAnchor.constraint(equalToConstant: 45),
            continueButton.widthAnchor.constraint(equalToConstant: 330),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    @objc func recoveryButton() {
        let vc = RecoveryViewController()
        vc.title = "Восстановление пароля"
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        vc.navigationItem.backBarButtonItem = backBarButton
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

