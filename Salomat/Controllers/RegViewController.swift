//
//  RegViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 04/11/22.
//

import UIKit

class RegViewController: UIViewController {
    
    lazy var phone: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Телефон"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите свой номер"
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
    
    lazy var password: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
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
        button.setTitleColor(UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitle("Регистрация", for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(postNo2), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Регистрация"
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(phone)
        view.addSubview(phoneTextField)
        view.addSubview(signUp)
        view.addSubview(password)
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            phone.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            phone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            phoneTextField.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 5),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneTextField.heightAnchor.constraint(equalToConstant: 45),
            phoneTextField.widthAnchor.constraint(equalToConstant: 330),
            phoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            password.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 16),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            passwordTextField.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordTextField.widthAnchor.constraint(equalToConstant: 330),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //signUp.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 465),
            signUp.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -15),
            signUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUp.heightAnchor.constraint(equalToConstant: 45),
            signUp.widthAnchor.constraint(equalToConstant: 330),
            signUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ])
    }
    
    @objc func post() {
        guard let url = URL(string: "http://salomat.colibri.tj/users/register") else {return}
        var parameters = ["phone=000505547&password=jm1995"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let jsonDictionary = NSMutableDictionary()
        //jsonDictionary.setValue("1", forKey: "user_id")
        jsonDictionary.setValue("khfkskh0", forKey: "password")
        jsonDictionary.setValue("753980601", forKey: "phone")
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: jsonDictionary) else {return}
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            }
            catch {
                print(error)
            }
        }.resume()
    }
    
    @objc func postNo2() {
        guard let url = URL(string: "http://salomat.colibri.tj/users/register") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "phone": phoneTextField.text!,
            "password": passwordTextField.text!
        ]
        request.httpBody = parameters.percentEncoded()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                error == nil
            else {                                                               // check for fundamental networking error
                print("error", error ?? URLError(.badServerResponse))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            }
            catch {
                
            }
            
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
        }
        task.resume()
    }
    
    @objc func test() {
        let vc = SliderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
