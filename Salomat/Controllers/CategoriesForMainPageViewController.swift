//
//  CategoriesForMainPageViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 24/10/22.
//

import UIKit

class CategoriesForMainPageViewController: UIViewController {
    var network = NetworkService()
    var collectionView = CategoriesForMainPageTwoCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
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