//
//  BasketViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit
import CoreData

class CartViewController: UIViewController {
    var basketCollectionView = CartCollectionView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var totalCollectionView = TotalCollectionView()
    var network = NetworkService()
    var data = [Basket]()
    
    lazy var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView2: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var uiView3: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var promocode: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Активировать промо код"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 0.929, green: 0.929, blue: 1, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var promocodeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        button.setImage(UIImage(named: "inactive.icon"), for: .normal)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitle("Оформить заказ", for: .normal)
        button.layer.cornerRadius = 4
        //button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Корзина"
        basketCollectionView.layer.borderColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1).cgColor
        //basketCollectionView.layer.borderWidth = 1
            configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadArticles()
    }
    
    func configureConstraints() {
        view.addSubview(basketCollectionView)
//        view.addSubview(promocode)
//        view.addSubview(promocodeButton)
        view.addSubview(uiView)
        view.addSubview(uiView2)
        view.addSubview(uiView3)
        view.addSubview(button)
        
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
            
            basketCollectionView.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 30),
            basketCollectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            basketCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            basketCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width - 32),
            
//            promocode.topAnchor.constraint(equalTo: basketCollectionView.bottomAnchor, constant: 15),
//            promocode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            promocode.trailingAnchor.constraint(equalTo: promocodeButton.leadingAnchor, constant: -10),
//            promocode.heightAnchor.constraint(equalToConstant: 45),
//
//            promocodeButton.topAnchor.constraint(equalTo: basketCollectionView.bottomAnchor, constant: 15),
//            promocodeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            promocodeButton.heightAnchor.constraint(equalToConstant: 45),
//            promocodeButton.widthAnchor.constraint(equalToConstant: 45),
            
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 45)
            
            
    
        ])
    }
    
    @objc func buttonAction() {
        let vc = InfoAboutDeliveryViewController()
        vc.title = "Информация о доставке"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadArticles() {
        let request: NSFetchRequest <Basket> = Basket.fetchRequest()
        do {
            data = try context.fetch(request)
            basketCollectionView.data = data
            basketCollectionView.reloadData()
        }catch {
            print("Error fetching data from context \(error)")
        }
    }

    
//    func fetchBlogData(){
//        let urlString = "http://salomat.colibri.tj/blogs/blog_popular?page=1"
//        self.network.fetchBlogsData(urlString: urlString) { [weak self] (result) in
//            guard let self = self else {return}
//            switch result {
//            case .success(let response):
//                self.basketCollectionView.blogs = response
//                print(result)
//                self.basketCollectionView.reloadData()
//            case .failure(let error):
//                print("error", error)
//            }
//        }
//    }
}
