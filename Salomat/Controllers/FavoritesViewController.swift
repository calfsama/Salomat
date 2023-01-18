//
//  FavoritesViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    var network = NetworkService()
    var favoriteCollectionView: FavoriteCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранное"
        favoriteCollectionView = FavoriteCollectionView(nav: self.navigationController!)
        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorites()
    }
    
    func configureConstraints() {
        view.addSubview(favoriteCollectionView)
        
        NSLayoutConstraint.activate([
            favoriteCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            favoriteCollectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height)
        ])
    }
    
    func favorites(){
        let urlString = "http://slomat2.colibri.tj/favorites?user_id=15"
        self.network.favorites(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.favoriteCollectionView.favorites = response
                self.favoriteCollectionView.reloadData()
                self.favoriteCollectionView.indicator.stopAnimating()
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
