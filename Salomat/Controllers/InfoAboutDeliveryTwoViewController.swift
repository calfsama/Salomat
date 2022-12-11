//
//  InfoAboutDeliveryTwoViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 14/10/22.
//

import UIKit

class InfoAboutDeliveryTwoViewController: UIViewController {
    
    struct OrderProducts {
        var product_id: Int
        var product_count: Int
    }
    
    lazy var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView2: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView3: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView4: UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 4
        uiView.layer.borderWidth = 1
        uiView.layer.borderColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1).cgColor
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView5: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var goods: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "Товар"
        label.textColor = UIColor(red: 0.118, green: 0.196, blue: 0.235, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var total: UILabel = {
        let label = UILabel()
        label.text = "Всего"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 0.118, green: 0.196, blue: 0.235, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var delivery: UILabel = {
        let label = UILabel()
        label.text = "Доставка"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(red: 0.118, green: 0.196, blue: 0.235, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Radiobutton2"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Radiobutton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Обычная доставка в течении 3-х часов - 5 сом"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(red: 0.118, green: 0.196, blue: 0.235, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel()
        label.text = "Срочная доставка в течении 45 минут - 20 сом"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(red: 0.118, green: 0.196, blue: 0.235, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var uiView6: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
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
    
    lazy var book: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Продолжить", for: .normal)
        button.addTarget(self, action: #selector(order), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var goodsCollectionView = GoodsCollectionView()
    var collectionView = InfoAboutDeliveryCollectionView()
    var collection = SummaCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        goodsCollectionView.set(cells: Medical.items())
        configureConstraints()
    }
    
    @objc func order() {
        let url = URL(string: "http://slomat2.colibri.tj/orders")!
        var request = URLRequest(url: url)
        request.setValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjExMiIsImxvZ2luIjoiOTg3MzA1OTU5IiwidGltZSI6MTY2OTU1MzMyN30.TZKePf9Wza_mXTrs3pVK6Pt3P9ftp8ZuaxnXfNYQ2yY", forHTTPHeaderField: "Authorization")
        request.setValue("text/html", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "total_price": "233",
            "user_id": "112",
            "phone_number": "987305959",
            "phone_number2": "987330321",
            "name": "tom",
            "product_total_count": 1,
            "address": "kfnknf",
            "comment": "knfk",
            "delivery_id": 1,
            "products":  [OrderProducts(product_id: 3, product_count: 1)]
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
    
    func configureConstraints() {
        view.addSubview(uiView)
        view.addSubview(uiView2)
        view.addSubview(uiView3)
        view.addSubview(uiView4)
        view.addSubview(goods)
        view.addSubview(total)
        view.addSubview(uiView5)
        view.addSubview(goodsCollectionView)
        view.addSubview(collectionView)
        view.addSubview(delivery)
        view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(label)
        view.addSubview(label2)
        view.addSubview(uiView6)
        view.addSubview(collection)
        view.addSubview(cancel)
        view.addSubview(book)
        
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            uiView.heightAnchor.constraint(equalToConstant: 3),
            uiView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
            
            uiView2.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            uiView2.leadingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: 11),
            uiView2.heightAnchor.constraint(equalToConstant: 3),
            uiView2.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
            
            uiView3.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            uiView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            uiView3.heightAnchor.constraint(equalToConstant: 3),
            uiView3.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
        
            uiView4.topAnchor.constraint(equalTo: uiView.bottomAnchor, constant: 30),
            uiView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            uiView4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            uiView4.heightAnchor.constraint(equalToConstant: 390),
            
            goods.topAnchor.constraint(equalTo: uiView4.topAnchor, constant: 23),
            goods.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 20),
            
            total.topAnchor.constraint(equalTo: uiView4.topAnchor, constant: 23),
            total.trailingAnchor.constraint(equalTo: uiView4.trailingAnchor, constant: -20),
            
            uiView5.topAnchor.constraint(equalTo: goods.bottomAnchor, constant: 20),
            uiView5.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 16),
            uiView5.trailingAnchor.constraint(equalTo: uiView4.trailingAnchor, constant: -16),
            uiView5.heightAnchor.constraint(equalToConstant: 1),
            
            goodsCollectionView.topAnchor.constraint(equalTo: uiView5.bottomAnchor, constant: 20),
            goodsCollectionView.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 2),
            goodsCollectionView.trailingAnchor.constraint(equalTo: uiView4.trailingAnchor, constant: -2),
            goodsCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: goodsCollectionView.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 1),
            collectionView.trailingAnchor.constraint(equalTo: uiView4.trailingAnchor, constant: -1),
            collectionView.heightAnchor.constraint(equalToConstant: 50),
            
            delivery.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            delivery.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 23),
            
            button.topAnchor.constraint(equalTo: delivery.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 21),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalToConstant: 20),
            
            button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            button2.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 21),
            button2.heightAnchor.constraint(equalToConstant: 20),
            button2.widthAnchor.constraint(equalToConstant: 20),
            
            label.topAnchor.constraint(equalTo: delivery.bottomAnchor, constant: 19),
            label.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 5),
            
            label2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 14),
            label2.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 5),
            
            uiView6.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            uiView6.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 16),
            uiView6.trailingAnchor.constraint(equalTo: uiView4.trailingAnchor, constant: -16),
            uiView6.heightAnchor.constraint(equalToConstant: 1),
            
            collection.topAnchor.constraint(equalTo: uiView6.bottomAnchor, constant: 10),
            collection.leadingAnchor.constraint(equalTo: uiView4.leadingAnchor, constant: 1),
            collection.trailingAnchor.constraint(equalTo: uiView4.trailingAnchor, constant: -1),
            collection.heightAnchor.constraint(equalToConstant: 50),
            
            cancel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            cancel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cancel.heightAnchor.constraint(equalToConstant: 45),
            cancel.widthAnchor.constraint(equalToConstant: 160),
            
            book.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            book.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            book.leadingAnchor.constraint(equalTo: cancel.trailingAnchor, constant: 20),
            book.heightAnchor.constraint(equalToConstant: 45),
            book.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
    
}
