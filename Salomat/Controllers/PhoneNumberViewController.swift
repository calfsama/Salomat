//
//  PhoneNumberViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 13/10/22.
//

import UIKit

class PhoneNumberViewController: UIViewController {
    lazy var phone: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Номер телефона"
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "+992 932 55 44 55"
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Номер телефона"
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(phone)
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            phone.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            phone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 45),
            textField.widthAnchor.constraint(equalToConstant: 330)
        ])
    }
}
