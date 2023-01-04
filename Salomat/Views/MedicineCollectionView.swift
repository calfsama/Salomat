//
//  MedicineCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 07/10/22.
//

import UIKit
import CoreData

class MedicineCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var inStock = ""
    //var Image
    var imageName = "123"
    var color = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var category: String = ""
    var text: String = ""
    var inCart: String = ""
    var withoutReceipt: String = ""
    var substance: String = ""
    var production: String = ""
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
        register(MedicineFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MedicineFooterCollectionReusableView.identifier)
        self.addSubview(indicator)
        self.bringSubviewToFront(indicator)
        indicator.frame = CGRect(x: 180, y: 280, width: 40, height: 40)
        indicator.color = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        indicator.startAnimating()
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        backgroundColor = .white
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
        cell.image.image = UIImage(named: "123")
        cell.note.text = text
        cell.buttonSave.setTitle(inCart, for: .normal)
        cell.buttonSave.backgroundColor = color
        cell.inStock.text = inStock
        cell.label.text = withoutReceipt
        cell.label2.text = substance
        cell.label3.text = production
        cell.label4.text = category
        cell.medicineName.text = productShow?.product?.product_name ?? ""
        cell.price.text = productShow?.product?.product_price ?? ""
        cell.productDescription.attributedText = productShow?.product?.product_about?.html2Attributed
        cell.label5.text = productShow?.product?.product_form?.form_name ?? ""
        cell.label6.text = productShow?.product?.product_brand?.brand_name ?? ""
        cell.label7.text = productShow?.product?.categories?[indexPath.row].category_name ?? ""
        cell.title = productShow?.product?.product_name ?? ""
        cell.prices = productShow?.product?.product_price ?? ""
        cell.images = productShow?.product?.product_pic ?? ""
        cell.is_favorite = ((productShow?.product?.is_favorite) != nil)
        cell.id = productShow?.product?.id ?? ""
        let url = "http://slomat2.colibri.tj/upload_product/"
        let completeURL = url + (productShow?.product?.product_pic ?? "")
        cell.image.downloaded(from: completeURL)
        
        if productShow?.product?.is_favorite == true {
            cell.favorite.setImage(UIImage(named: "heart"), for: .normal)
        }
        else {
            cell.favorite.setImage(UIImage(named: "favorite"), for: .normal)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MedicineFooterCollectionReusableView.identifier, for: indexPath) as! MedicineFooterCollectionReusableView
        footer.configure()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = BlackViewController()
//        self.inputViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
