//
//  AboutProductViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 20/01/23.
//

import UIKit
import CoreData
import Cosmos
import Kingfisher

class AboutProductViewController: UIViewController {
    static let identifier = "HeaderMedicineCollectionReusableView"
    var medicinesCollectionViewCell = MedicinesCollectionViewCell()
    var dataModel = [DataModel]()
    var dataBasket = [Basket]()
    var id: String = ""
    var is_favorite: Bool = false
    var titleMedicine: String = ""
    var images: String = ""
    var prices: String = ""
    var commitPredicate: NSPredicate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var productShow: ProductsShow?
    var network = NetworkService()
    var spinner = UIActivityIndicatorView()
    
    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = view.bounds
        scroll.showsVerticalScrollIndicator = false
        scroll.contentSize = CGSize(width: view.frame.size.width, height: 3200)
        scroll.backgroundColor = .white
        return scroll
    }()
    
    lazy var cosmosView: CosmosView = {
        let cosmos = CosmosView()
        cosmos.settings.minTouchRating = 0.0
        cosmos.rating = 0.0
        cosmos.settings.fillMode = .precise
        cosmos.settings.starMargin = 4.5
        cosmos.translatesAutoresizingMaskIntoConstraints = false
        return cosmos
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var favorite: UIButton = {
        let button = UIButton()
        // button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var medicineName: UILabel = {
        let medicineName = UILabel()
        medicineName.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        medicineName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        medicineName.numberOfLines = 3
        medicineName.translatesAutoresizingMaskIntoConstraints = false
        return medicineName
    }()
    
    lazy var note: UILabel = {
        let note = UILabel()
        note.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        note.numberOfLines = 0
        note.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        note.translatesAutoresizingMaskIntoConstraints = false
        return note
    }()
    
    lazy var price: UILabel = {
        let price = UILabel()
        price.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        price.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    lazy var buttonSave: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        //button.addTarget(self, action: #selector(saveInBasket), for: .touchUpInside)
        button.setTitle("В корзину", for: .normal)
        button.backgroundColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var inStock: UILabel = {
        let inStock = UILabel()
        inStock.textColor = UIColor(red: 0.235, green: 0.902, blue: 0.51, alpha: 1)
        inStock.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        inStock.translatesAutoresizingMaskIntoConstraints = false
        return inStock
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label3: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label4: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label5: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label6: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label7: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scroll)
        spinner.color = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        spinner.frame = CGRect(x: 170, y: 340, width: 40, height: 40)
        scroll.addSubview(spinner)
        spinner.startAnimating()
        fetchBanner()
        
    }
    
    func fetchBanner(){
        let urlString = "http://slomat2.colibri.tj/products/show?product_id=22"
        self.network.productShow(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.productShow = response
                //                print(result)
                //self.reviewCollectionView.productShow = response
                // self.review.productShow = response
                //self.collection.reloadData()
                self.id = self.id
                let url = "http://slomat2.colibri.tj/upload_product/"
                let completeURL = url + (self.productShow?.product?.product_pic ?? "")
                self.image.kf.setImage(with: URL(string: completeURL))
                self.note.text = "Внешний вид товара может отличаться от изображённого на фотографии"
                
                self.inStock.text = "В наличии"
                self.label.text = "Безрецептурный ПРЕПАРАТ"
                self.label2.text = "Действующее вещество (МНН):"
                self.label3.text = "Производитель:"
                self.label4.text = "Категория:"
                self.label5.text = self.productShow?.product?.product_form?.form_name ?? ""
                self.label6.text = self.productShow?.product?.product_brand?.brand_name ?? ""
                self.label7.text = self.productShow?.product?.categories?[0].category_name ?? ""
                //self.collection.indicator.stopAnimating()
                self.configureConstraints()
                self.spinner.stopAnimating()
                print(result)
            case .failure(let error):
                print("error", error)
            }
        }
    }
        
        func configureConstraints() {
            scroll.addSubview(image)
            scroll.addSubview(medicineName)
            scroll.addSubview(note)
            scroll.addSubview(cosmosView)
            scroll.addSubview(price)
            scroll.addSubview(favorite)
            scroll.addSubview(buttonSave)
            scroll.addSubview(inStock)
            scroll.addSubview(label)
            scroll.addSubview(label2)
            scroll.addSubview(label3)
            scroll.addSubview(label4)
            scroll.addSubview(label5)
            scroll.addSubview(label6)
            scroll.addSubview(label7)
            //        addSubview(productDescription)
            
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 10),
                image.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
                image.widthAnchor.constraint(equalToConstant: 360),
                image.heightAnchor.constraint(equalToConstant: 360),
                
                favorite.topAnchor.constraint(equalTo: image.topAnchor),
                favorite.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -30),
                favorite.heightAnchor.constraint(equalToConstant: 30),
                favorite.widthAnchor.constraint(equalToConstant: 30),
                
                medicineName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
                medicineName.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                medicineName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                
                note.topAnchor.constraint(equalTo: medicineName.bottomAnchor, constant: 16),
                note.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
                note.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                
                cosmosView.topAnchor.constraint(equalTo: note.bottomAnchor, constant: 20),
                cosmosView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                cosmosView.heightAnchor.constraint(equalToConstant: 40),
                cosmosView.widthAnchor.constraint(equalToConstant: 200),
                
                price.topAnchor.constraint(equalTo: cosmosView.bottomAnchor, constant: 20),
                price.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                
                buttonSave.topAnchor.constraint(equalTo: cosmosView.bottomAnchor, constant: 11),
                buttonSave.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                buttonSave.widthAnchor.constraint(equalToConstant: 120),
                buttonSave.heightAnchor.constraint(equalToConstant: 45),
                
                inStock.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 16),
                inStock.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                
                label.topAnchor.constraint(equalTo: inStock.bottomAnchor, constant: 12),
                label.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                
                label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
                label2.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                
                label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 3),
                label3.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                
                label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 3),
                label4.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 16),
                
                label5.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 11),
                label5.leadingAnchor.constraint(equalTo: label2.trailingAnchor, constant: 3),
                
                label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 7),
                label6.leadingAnchor.constraint(equalTo: label3.trailingAnchor, constant: 3),
                
                label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 7),
                label7.leadingAnchor.constraint(equalTo: label4.trailingAnchor, constant: 3),
                
                //            productDescription.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 20),
                //            productDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                //            productDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
                
            ])
        }
    }
