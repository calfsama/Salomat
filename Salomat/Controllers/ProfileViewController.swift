//
//  ProfileViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var phone: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Телефон"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
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
    
    lazy var signUp: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitle("Регистрация", for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.layer.cornerRadius = 4
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitle("Далее", for: .normal)
        button.addTarget(self, action: #selector(checkPhone), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Вход"
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(phone)
        view.addSubview(textField)
        view.addSubview(signUp)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            phone.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            phone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 45),
            textField.widthAnchor.constraint(equalToConstant: 330),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            //signUp.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 465),
            signUp.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -15),
            signUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUp.heightAnchor.constraint(equalToConstant: 45),
            signUp.widthAnchor.constraint(equalToConstant: 330),
            signUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            continueButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.heightAnchor.constraint(equalToConstant: 45),
            continueButton.widthAnchor.constraint(equalToConstant: 330),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func buttonAction() {
        let vc = PasswordViewController()
        vc.title = "Вход"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonAction2() {
        let vc = RegViewController()
        vc.title = "Вход"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func postRequestButton() {
        let url = URL(string: "http://salomat.colibri.tj/users/check_phone")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "phone": "\(textField)"
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
            
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
            // do whatever you want with the `data`, e.g.:
            
            do {
                let responseObject = try JSONDecoder().decode(CheckPhone.self, from: data)
                print(responseObject)
            } catch {
                print(error) // parsing error
                
                if let responseString = String(data: data, encoding: .utf8) {
                    print("responseString = \(responseString)")
                } else {
                    print("unable to parse response as string")
                }
            }
        }

        task.resume()
    }
    
    @objc func post() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var parameters = ["phone" : textField.text, "password" : textField.text]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters) else {return}
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
    
    @objc func ppost() {
        guard let url = URL(string: "http://salomat.colibri.tj/users/register") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue("1", forKey: "user_id")
        jsonDictionary.setValue(textField.text, forKey: "phone")
        
        let jsonData : Data
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: JSONSerialization.WritingOptions ())
            request.httpBody = jsonData
        }
        catch {
            print("Error creating JSON")
            return
        }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            print("Error: \(error)")
            print("Response: \(response)")
            print("Data: \(data)")
        }
    }
    
    @objc func checkPhone() {
        guard let url = URL(string: "http://salomat.colibri.tj/users/check_phone") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "phone": textField.text!
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

            else {                                                               // check for fundamental networking error
                print("error", error ?? URLError(.badServerResponse))
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data)
               
                print(json)
            }
            catch {
                print(error)
            }
            
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
        }
        task.resume()
    
    }
}
