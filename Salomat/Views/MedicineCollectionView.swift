//
//  MedicineCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 07/10/22.
//

import UIKit
import CoreData

class MedicineCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var productShow: ProductsShow?
    var dataModel = [DataModel]()
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var commitPredicate: NSPredicate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(MedicineCollectionViewCell.self, forCellWithReuseIdentifier: MedicineCollectionViewCell.identifier)
        self.addSubview(indicator)
        self.bringSubviewToFront(indicator)
        indicator.frame = CGRect(x: 170, y: 280, width: 40, height: 40)
        indicator.startAnimating()
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MedicineCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MedicineCollectionViewCell.identifier, for: indexPath) as! MedicineCollectionViewCell
        cell.medicineName.text = productShow?.product?.product_name ?? ""
        cell.price.text = productShow?.product?.product_price ?? "50.00"
        cell.productDescription.attributedText = productShow?.product?.product_about?.html2Attributed
        cell.note.text = "Внешний вид товара может отличаться от изображённого на фотографии"
        cell.label5.text = productShow?.product?.product_form?.form_name ?? ""
        cell.label6.text = productShow?.product?.product_brand?.brand_name ?? ""
        cell.label7.text = productShow?.product?.categories?[indexPath.row].category_name ?? ""
        cell.title = productShow?.product?.product_name ?? ""
        cell.prices = productShow?.product?.product_price ?? ""
        cell.images = productShow?.product?.product_pic ?? ""
        cell.is_favorite = ((productShow?.product?.is_favorite) != nil)
        cell.id = productShow?.product?.id ?? ""
        let url = "http://salomat.colibri.tj/upload_product/"
        let completeURL = url + (productShow?.product?.product_pic ?? "")
        cell.image.downloaded(from: completeURL)
        let fetchRequest: NSFetchRequest <DataModel> = DataModel.fetchRequest()
        fetchRequest.predicate = commitPredicate
        commitPredicate = NSPredicate(format: "title == %@", cell.title)
        do {
            let data = try context.fetch(fetchRequest)
            for i in data {
                if i.title == cell.title {
                    //print("\(i.title) and \(title)")
                    cell.favorite.setImage(UIImage(named: "heart"), for: .normal)
                }
                else if i.title == nil{
                    cell.favorite.setImage(UIImage(named: "iconHeart"), for: .normal)
                }
            }
        }
        catch {
            print("Error\(error)")
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
