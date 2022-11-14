//
//  PhoneNumberViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 13/10/22.
//

import UIKit

class PhoneNumberViewController: UIViewController {
    var phoneNumber: String = ""
    var userID: String = ""
    var personalInfo = PersonalInfoViewController()
    var login: LoginData?
    var token: String = ""
    
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
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor( UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(updatePhone), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Номер телефона"
        userShow()
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(phone)
        view.addSubview(textField)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            phone.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            phone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 45),
            
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    func userShow() {
        guard let url = URL(string: "http://salomat.colibri.tj/users/show/\(userID)") else { return }
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                error == nil
                    
            else {                                                                //check for fundamental networking error
                print("error", error ?? URLError(.badServerResponse))
                return
            }
            
            do {
                let responseObject = try JSONDecoder().decode(LoginData.self, from: data)
                DispatchQueue.main.async {
                    self.login = responseObject
                    self.textField.text = self.login?[0].login
                }
                print(responseObject)
            } catch {
                print(error) // parsing error
                
                if let responseString = String(data: data, encoding: .utf8) {
                    print("responseString = \(responseString)")
                } else {
                    print("unable to parse response as string")
                }
            }
        }.resume()
    }
    
    @objc func updatePhone() {
        guard let url = URL(string: "http://salomat.colibri.tj/users/update_user/\(userID)") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "login": textField.text!,
            "comfirm": 0 ,
        ]
            request.httpBody = parameters.percentEncoded()
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                error == nil
                    
            else {                                                                //check for fundamental networking error
                print("error", error ?? URLError(.badServerResponse))
                return
            }
            if response.statusCode == 200 {
                DispatchQueue.main.async {
                    let vc = ProfileInfoViewController()
                    vc.title = "Профиль"
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            else if response.statusCode == 400 {
                DispatchQueue.main.async {
                  print("errrooor")
                }

                print("user doesn't exist")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json, "first")
            }
            catch {
                print(error, "second")
            }
        }
        task.resume()
    }
}
