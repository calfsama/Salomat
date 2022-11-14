//
//  MedicineViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 19/09/22.
//

import UIKit
import CoreData

class MedicineViewController: UIViewController, UIScrollViewDelegate {
    var medicineCollectionView = MedicineCollectionView()
    var medicineCollectionViewCell = MedicineCollectionViewCell()
    var commitPredicate: NSPredicate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var network = NetworkService()
    var dataModel = [DataModel]()
    var titleMedicine: String = ""
    var price: String = ""
    var image: String = ""
    var id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchBanner()
        configureConstraints()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        if let flowLayout = medicineCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
           }
    }
    
    func configureConstraints() {
        view.addSubview(medicineCollectionView)
        
        NSLayoutConstraint.activate([
            medicineCollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            medicineCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            medicineCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            medicineCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
    func fetchBanner(){
        let urlString = "http://salomat.colibri.tj/products/show?product_id=\(id)"
        self.network.productShow(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.medicineCollectionView.productShow = response
//                print(result)
                self.medicineCollectionView.reloadData()
                self.medicineCollectionView.text = "Внешний вид товара может отличаться от изображённого на фотографии"
                self.medicineCollectionView.inCart = "В корзину"
                self.medicineCollectionView.color = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
                self.medicineCollectionView.inStock = "В наличии"
                self.medicineCollectionView.withoutReceipt = "Безрецептурный ПРЕПАРАТ"
                self.medicineCollectionView.substance = "Действующее вещество (МНН):"
                self.medicineCollectionView.production = "Производитель:"
                self.medicineCollectionView.category = "Категория:"
                self.medicineCollectionView.indicator.stopAnimating()
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
