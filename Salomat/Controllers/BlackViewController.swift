//
//  BlackViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 22/10/22.
//

import UIKit

class BlackViewController: UIViewController {
    var network = NetworkService()
    var collectionView = CategoriesForMainPageCollectionView()
    
    lazy var viewTitle: UILabel = {
        let label = UILabel()
        label.text = "Каталог товаров"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        fetchData()
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(viewTitle)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            collectionView.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchData(){
        let urlString = "http://salomat.colibri.tj/products/categories"
        self.network.category(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.collectionView.category = response
                self.collectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
