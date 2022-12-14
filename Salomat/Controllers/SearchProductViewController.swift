//
//  SearchProductViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/12/22.
//

import UIKit

class SearchProductViewController: UIViewController, UISearchResultsUpdating {
    var collectionView = SearchCollectionView()
    var network = NetworkService()
    var searchController = UISearchController()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Результаты"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ratingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1).cgColor
        button.setTitle("Популярное", for: .normal)
        button.setTitleColor(UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraints()
        setup()
        let logo = UIImage(named: "logo 2")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filtt"), style: .plain, target: self, action: #selector(filter))
     
    }
    
    func setup() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchResultsUpdater = self
    }
    
    func configureConstraints() {
        view.addSubview(ratingButton)
        view.addSubview(label)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            ratingButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            ratingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ratingButton.widthAnchor.constraint(equalToConstant: 120),
            ratingButton.heightAnchor.constraint(equalToConstant: 35),
            label.topAnchor.constraint(equalTo: ratingButton.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        let urlString = "http://slomat2.colibri.tj/search/?srch_pr_inp=\(searchText)"
        self.network.search(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                //self.collectionView.search?.data?.srch_inp = searchText
                self.collectionView.search = response
                print(urlString)
                print(searchText)
                print(result)
                self.collectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
        print(searchText)
    }
    
//    func search() {
//        //let urlString = "http://salomat.colibri.tj/search/?srch_pr_inp=\(searchText)"
//        self.network.searchText(searchText: self.searchText) { [weak self] (result) in
//            guard let self = self else {return}
//            switch result {
//            case .success(let response):
//                self.collectionView.search?.data?.srch_inp = self.searchText
//                self.collectionView.search = response
//                //print(urlString)
//                print(result)
//                self.collectionView.reloadData()
//            case .failure(let error):
//                print("error", error)
//            }
//        }
//    }
    
    @objc func filter() {
        let vc =  SliderViewController()
        vc.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *) {

            if let presentationController = vc.presentationController as? UISheetPresentationController {
                presentationController.detents =  [.medium()]
                self.present(vc, animated: true)
            }
        } else {
            // Fallback on earlier versions
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
