//
//  PersonalInfoViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 03/10/22.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Имя"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пано Дианова"
        textField.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
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
    
    lazy var email: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Электронная почта"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
    
    lazy var address: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Адрес"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    var datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        createDatePicker()
        configureConstraints()
       
    }
    
    func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        //assign toolbar
        nameTextField.inputAccessoryView = toolBar
        
        // assign date picker to the text field
        nameTextField.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
    }
    
    
    func configureConstraints() {
        view.addSubview(name)
        view.addSubview(nameTextField)
        view.addSubview(email)
        view.addSubview(emailTextField)
        view.addSubview(address)
        view.addSubview(addressTextField)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: name.topAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            email.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            emailTextField.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            address.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            address.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            addressTextField.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 10),
            addressTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addressTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addressTextField.heightAnchor.constraint(equalToConstant: 45),
        
        
        
        ])
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        nameTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
