//
//  PasswordViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 26/09/22.
//

import UIKit
import SwiftKeychainWrapper
import Locksmith
import KeychainAccess

class PasswordViewController: UIViewController {
    var phone: String = ""
    var network = NetworkService()
    var userData: Token?
    var token: String = ""
    var userID: String = ""
    var appDelegate = AppDelegate()
    var condition: Bool = false
    
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
        textField.isSecureTextEntry = true
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
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eye closed"), for: .normal)
        button.addTarget(self, action: #selector(eyeButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var wrongPasswod: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 0.937, green: 0.365, blue: 0.439, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraints()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        self.hideKeyboardWhenTappedAround()
        token = userData?.data?[0].token ?? ""
        userID = userData?.data?[0].user_id ?? ""
        print(token, " ", userID)
    }
    
    func configureConstraints() {
        view.addSubview(password)
        view.addSubview(textField)
        view.addSubview(eyeButton)
        view.addSubview(signUp)
        view.addSubview(continueButton)
        view.addSubview(wrongPasswod)
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 45),
            textField.widthAnchor.constraint(equalToConstant: 330),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -20),
            
            wrongPasswod.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            wrongPasswod.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            signUp.bottomAnchor.constraint(equalTo: continueButton.layoutMarginsGuide.topAnchor, constant: -16),
            signUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUp.heightAnchor.constraint(equalToConstant: 45),
            signUp.widthAnchor.constraint(equalToConstant: 330),
            signUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            continueButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.heightAnchor.constraint(equalToConstant: 45),
            continueButton.widthAnchor.constraint(equalToConstant: 330),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func eyeButtonAction() {
        if condition == false {
            condition = true
            eyeButton.setImage(UIImage(named: "Group"), for: .normal)
            textField.isSecureTextEntry = false
        }
        else if condition == true {
            condition = false
            eyeButton.setImage(UIImage(named: "eye closed"), for: .normal)
            textField.isSecureTextEntry = true
        }
    }
    
    @objc func recoveryButton() {
        let vc = RecoveryViewController()
        vc.title = "Восстановление пароля"
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        vc.phoneNumber = phone
        vc.navigationItem.backBarButtonItem = backBarButton
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func login() {
        guard let url = URL(string: "http://slomat2.colibri.tj/users/login") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "phone": "\(phone)",
            "password": textField.text!
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
                print(error ?? URLError(.badServerResponse))
                return
            }
            
            do {
                let urlData = try JSONDecoder().decode(Token.self, from: data)
                print(urlData, "yyeeeeh")
                self.userData = urlData
                let user_id = self.userData?.data?[0].user_id ?? ""
                let token = self.userData?.data?[0].token ?? ""
               // save data in Keychain
                let keychain = Keychain(service: "com.tomirisnegmatova.Salomat")
                keychain["UserID"] = user_id
                keychain["Token"] = token
                print(self.userData, "ooommmgg")
            }catch let jsonError {
                print("Failed to decode JSON", jsonError)
                if let responseString = String(data: data, encoding: .utf8) {
                    print("responseString = \(responseString)")
                }
            }
            
            if response.statusCode >= 200 && response.statusCode <= 299 {
                DispatchQueue.main.async {
                    let user_id = self.userData?.data?[0].user_id ?? ""
                   // save data in Keychain
                    let keychain = Keychain(service: "com.tomirisnegmatova.Salomat")
                    keychain["UserID"] = user_id
                    let vc = ProfileInfoViewController()
                    vc.title = "Профиль"
                    vc.userID = self.userData?.data?[0].user_id ?? ""
                    vc.token = self.userData?.data?[0].token ?? ""
                    vc.phone = self.phone
                    let saveSuccessful: Bool = KeychainWrapper.standard.set(self.userData?.data?[0].token ?? "", forKey: "Authorization")
                    let saveToken: Bool = KeychainWrapper.standard.set(self.userData?.data?[0].token ?? "", forKey: "Token")
                    let saveAccessToken: Bool = KeychainWrapper.standard.set(self.userData?.data?[0].token ?? "", forKey: "AccessToken")
                    let saveAcToken: Bool = KeychainWrapper.standard.set(self.userData?.data?[0].token ?? "", forKey: "token")
                    let saveAccToken: Bool = KeychainWrapper.standard.set(self.userData?.data?[0].token ?? "", forKey: "ttoken")
                    print("Access Token \(saveSuccessful)")
                   // self.appDelegate.token = self.userData?.data?[0].token ?? ""
                    //self.navigationController?.pushViewController(vc, animated: true)
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBarController")
                    let reg = MainTabBarViewController()
                    reg.selectedIndex = 4
                    let appDelegate = UIApplication.shared.delegate
                    appDelegate?.window??.rootViewController = reg
                    
                }
            }
            else if response.statusCode == 400 {
                DispatchQueue.main.async {
                    self.wrongPasswod.text = "Введен неверный пароль"
                }
                
                print("user doesn't exist")
            }
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            }
            catch {
                print(error)
            }
            
            
            guard (200 ... 299) ~= response.statusCode else {                     //check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
  
            
//            URLSession.shared.dataTask(with: request) {(data, response, error) in
//                print(url)
//                DispatchQueue.main.async {
//                    if let error = error {
//                        print("Some error")
//                        return
//                    }
//                    guard let data = data else {return}
//                    do {
//                        let urlData = try JSONDecoder().decode(Token.self, from: data)
//                        print(urlData, "yyeeeeh")
//                    }catch let jsonError {
//                        print("Failed to decode JSON", jsonError)
//                        if let responseString = String(data: data, encoding: .utf8) {
//                            print("responseString = \(responseString)")
//                        }
//                    }
//                }
//
//            }
            
        }
        task.resume()
    }
}
        

