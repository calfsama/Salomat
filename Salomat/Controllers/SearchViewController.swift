//
//  SearchViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 25/10/22.
//

import UIKit

class SearchViewController: UIViewController {
    var collectionView = SearchCollectionView()
    var network = NetworkService()
    var searchData: Search?
    var searchText: String = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.search?.data?.srch_inp = searchText
        searchData?.data?.srch_inp = searchText
        search()
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
    
    func search(){
        let urlString = "http://salomat.colibri.tj/search/with_price?srch_pr_inp=\(collectionView.search?.data?.srch_inp ?? "линкас")"
        self.network.search(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.collectionView.search = response
                print(urlString)
                print(self.searchText)
                print(result)
                self.collectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
