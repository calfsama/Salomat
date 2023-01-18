//
//  TestTwoViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 22/11/22.
//

import UIKit

class TestTwoViewController: UIViewController {
    var collection = MedicineInfoCollectionView()
    var reviewCollectionView = ReviewCollectionView()
    var review = ReviewCollectionReusableView()
    var commitPredicate: NSPredicate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var network = NetworkService()
    var dataModel = [DataModel]()
    var titleMedicine: String = ""
    var price: String = ""
    var image: String = ""
    var id: String = ""
    var cell = SimilarProductsCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchBanner()
        view.addSubview(collection)
        review.id = id
        collection.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        collection.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func fetchBanner(){
        let urlString = "http://slomat2.colibri.tj/products/show?product_id=\(id)"
        self.network.productShow(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.collection.productShow = response
//                print(result)
                self.reviewCollectionView.productShow = response
                self.review.productShow = response
                self.collection.reloadData()
                self.collection.id = self.id
                self.cell.id = self.id
                self.collection.text = "Внешний вид товара может отличаться от изображённого на фотографии"
                self.collection.inCart = "В корзину"
                self.collection.color = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
                self.collection.inStock = "В наличии"
                self.collection.withoutReceipt = "Безрецептурный ПРЕПАРАТ"
                self.collection.substance = "Действующее вещество (МНН):"
                self.collection.production = "Производитель:"
                self.collection.category = "Категория:"
                self.collection.indicator.stopAnimating()
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
