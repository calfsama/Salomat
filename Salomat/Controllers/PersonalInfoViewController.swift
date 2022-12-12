//
//  PersonalInfoViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 03/10/22.
//

import UIKit
import KeychainAccess

class PersonalInfoViewController: UIViewController {
    
    let dataArray = ["Женский", "Мужской"]
    let picker = UIPickerView()
    var datePicker = UIDatePicker()
    var userID: String = ""
    var network = NetworkService()
    var login: LoginData?
    var token: String = ""
    var profile = ProfileInfoViewController()
    var alert: UIAlertController!
    let keychain = Keychain(service: "com.tomirisnegmatova.Salomat")
   
    
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
    
    lazy var gender: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Пол"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genderTextField: UITextField = {
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
    
    lazy var birthDate: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Дата рождения"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var birthDateTextField: UITextField = {
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
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor( UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(updateUserInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var nameMatch: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.937, green: 0.365, blue: 0.439, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addressMatch: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.937, green: 0.365, blue: 0.439, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        picker.delegate = self
        picker.dataSource = self
        self.hideKeyboardWhenTappedAround()
        genderTextField.inputView = picker
        //usersShow()
        userShow()
        configureConstraints()
        createDatePicker()
       
    }
    
    func configureConstraints() {
        view.addSubview(name)
        view.addSubview(nameTextField)
        view.addSubview(email)
        view.addSubview(emailTextField)
        view.addSubview(address)
        view.addSubview(addressTextField)
        view.addSubview(button)
        view.addSubview(gender)
        view.addSubview(genderTextField)
        view.addSubview(birthDate)
        view.addSubview(birthDateTextField)
        view.addSubview(nameMatch)
        view.addSubview(addressMatch)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            nameMatch.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 3),
            nameMatch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            gender.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            gender.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            genderTextField.topAnchor.constraint(equalTo: gender.bottomAnchor, constant: 10),
            genderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            genderTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            genderTextField.heightAnchor.constraint(equalToConstant: 45),
            
            birthDate.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 15),
            birthDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            birthDateTextField.topAnchor.constraint(equalTo: birthDate.bottomAnchor, constant: 10),
            birthDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            birthDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            birthDateTextField.heightAnchor.constraint(equalToConstant: 45),
            
            email.topAnchor.constraint(equalTo: birthDateTextField.bottomAnchor, constant: 15),
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
            
            addressMatch.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 3),
            addressMatch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func usersShow(){
        let urlString = "http://slomat2.colibri.tj/users/show/\(keychain["UserID"] ?? "")"
        self.network.login(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.login = response
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    func userShow() {
        guard let url = URL(string: "http://slomat2.colibri.tj/users/show/\(keychain["UserID"] ?? "")") else { return }
        var request = URLRequest(url: url)
        request.setValue(keychain["Token"] ?? "", forHTTPHeaderField: "Authorization")
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
                    self.nameTextField.text = self.login?[0].name
                    self.emailTextField.text = self.login?[0].email
                    self.addressTextField.text = self.login?[0].address
                    self.birthDateTextField.text = self.login?[0].birth_date
                    let vc = ProfileInfoViewController()
                    vc.name.text = self.login?[0].name
                    vc.email.text = self.login?[0].email
                    //self.profile.name.text = self.login?[0].name
                    //self.profile.email.text = self.login?[0].email
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
    
    func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        doneButton.tintColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        toolBar.setItems([doneButton], animated: true)
        //assign toolbar
        birthDateTextField.inputAccessoryView = toolBar
        
        // assign date picker to the text field
        birthDateTextField.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
       
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc func updateUserInfo() {
        guard let url = URL(string: "http://slomat2.colibri.tj/users/update_user/\(keychain["UserID"] ?? "")") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "name": nameTextField.text!,
            "email": emailTextField.text!,
            "birth_date": birthDateTextField.text!,
            "address": addressTextField.text!,
            "gender": genderTextField.text!
        ]
        
        if nameTextField.text != "" && addressTextField.text != "" {
            request.httpBody = parameters.percentEncoded()
        }
        else if nameTextField.text == "" && addressTextField.text == ""{
            self.nameMatch.text = "Введите Ваше имя"
            self.addressMatch.text = "Введите Ваш адрес"
        }
     
        
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
                    self.showAlert()
                    print("update")
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
    func showAlert() {
        self.alert = UIAlertController(title: "", message: "Изменения сохранены", preferredStyle: UIAlertController.Style.alert)
        self.present(self.alert, animated: true, completion: nil)
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)
    }

    @objc func dismissAlert(){
        // Dismiss the alert from here
        self.alert.dismiss(animated: true, completion: nil)
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthDateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
extension PersonalInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return dataArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = dataArray[row]
       return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = dataArray[row]
        genderTextField.resignFirstResponder()
    }
}

