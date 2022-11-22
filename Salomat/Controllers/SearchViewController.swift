//
//  SearchViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 25/10/22.
//

import UIKit

class SearchViewController: UIViewController {
    var collectionView = SearchCollectionView()
    let searchController = UISearchController(searchResultsController: nil)
    var network = NetworkService()
    var searchText: String = "линкас"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        title = "Search"
//        self.searchController.searchBar.placeholder = ""
//        self.searchController.hidesNavigationBarDuringPresentation = false
//        self.searchController.searchBar.searchBarStyle = .minimal
//        self.navigationItem.searchController = self.searchController
//        //self.navigationItem.titleView = self.searchController.searchBar
//        self.searchController.searchBar.delegate = self
//        self.searchController.obscuresBackgroundDuringPresentation = false
        print(searchText)
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
    
    func search() {
        //let urlString = "http://salomat.colibri.tj/search/?srch_pr_inp=\(searchText)"
        self.network.searchText(searchText: self.searchText) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.collectionView.search?.data?.srch_inp = self.searchText
                self.collectionView.search = response
                //print(urlString)
                print(result)
                self.collectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
}

//extension SearchViewController: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let urlString = "http://salomat.colibri.tj/search/?srch_pr_inp=\(searchText)"
//        self.network.search(urlString: urlString) { [weak self] (result) in
//            guard let self = self else {return}
//            switch result {
//            case .success(let response):
//                self.collectionView.search?.data?.srch_inp = searchText
//                self.collectionView.search = response
//                print(urlString)
//                print(searchText)
//                print(result)
//                self.collectionView.reloadData()
//            case .failure(let error):
//                print("error", error)
//            }
//        }
//    }
//}
