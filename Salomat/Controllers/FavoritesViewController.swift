//
//  FavoritesViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    var favoriteCollectionView: FavoriteCollectionView!
    var cell = MedicineCollectionViewCell()
    var data = [DataModel]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранное"
        favoriteCollectionView = FavoriteCollectionView(nav: self.navigationController!)
        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadArticles()
    }
    
    func configureConstraints() {
        view.addSubview(favoriteCollectionView)
        
        NSLayoutConstraint.activate([
            favoriteCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            favoriteCollectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height)
        ])
    }
    
    func loadArticles() {
        let request: NSFetchRequest <DataModel> = DataModel.fetchRequest()
        do {
            data = try context.fetch(request)
            favoriteCollectionView.data = data
            favoriteCollectionView.reloadData()
        }catch {
            print("Error fetching data from context \(error)")
        }
    }
    
}
