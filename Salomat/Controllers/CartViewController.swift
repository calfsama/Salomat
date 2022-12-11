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
        view.backgroundColor = .white
        basketCollectionView.layer.borderColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1).cgColor
        //basketCollectionView.layer.borderWidth = 1
        tabBarItem.badgeColor = .blue
        tabBarItem.badgeValue = "2"
        //tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor.rawValue: UIColor.red], for: .normal)
        //self.tabBar.items?[2].badgeValue = "12"
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadArticles()
        if data.count == 0 {
            configure()
        }
        else if data.count != 0{
            configureConstraints()
        }
       // basketCollectionView.displayTotal()
    }
    
    func configure() {
        view.addSubview(basketCollectionView)
        button.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            basketCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            basketCollectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            basketCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            basketCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
            
           
        ])
    }
    
    func configureConstraints() {
        view.addSubview(basketCollectionView)
//        view.addSubview(promocode)
//        view.addSubview(promocodeButton)
        view.addSubview(button)
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            basketCollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
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
