//
//  BlackViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 22/10/22.
//

import UIKit

class BlackViewController: UIViewController {
    var network = NetworkService()
    var categoriesForMainPage: CategoriesForMainPageCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        fetchCategories()
        categoriesForMainPage = CategoriesForMainPageCollectionView(nav: self.navigationController!)
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(categoriesForMainPage)
        
        NSLayoutConstraint.activate([
            categoriesForMainPage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            categoriesForMainPage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesForMainPage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesForMainPage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchCategories(){
        let urlString = "http://slomat2.colibri.tj/products/categories"
        self.network.category(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.categoriesForMainPage.category = response
                self.categoriesForMainPage.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
