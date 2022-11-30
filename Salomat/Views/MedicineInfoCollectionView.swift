//
//  MedicineInfoCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 22/11/22.
//

import UIKit

class MedicineInfoCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var inStock = ""
    var id: String = ""
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
        register(MedicineInfoCollectionViewCell.self, forCellWithReuseIdentifier: MedicineInfoCollectionViewCell.identifier)
        register(HeaderMedicineCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderMedicineCollectionReusableView.identifier)
        register(HeaderMedicineCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderMedicineCollectionReusableView.identifier)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension MedicineInfoCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MedicineInfoCollectionViewCell.identifier, for: indexPath) as! MedicineInfoCollectionViewCell
        cell.productDescription.attributedText = productShow?.product?.product_about?.html2Attributed
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //if kind == UICollectionView.elementKindSectionHeader {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderMedicineCollectionReusableView.identifier, for: indexPath) as! HeaderMedicineCollectionReusableView
        header.note.text = text
        header.buttonSave.setTitle(inCart, for: .normal)
        header.buttonSave.backgroundColor = color
        header.inStock.text = inStock
        header.label.text = withoutReceipt
        header.label2.text = substance
        header.label3.text = production
        header.label4.text = category
        header.medicineName.text = productShow?.product?.product_name ?? ""
        header.price.text = productShow?.product?.product_price ?? ""
//        header.productDescription.attributedText = productShow?.product?.product_about?.html2Attributed
        header.label5.text = productShow?.product?.product_form?.form_name ?? ""
        header.label6.text = productShow?.product?.product_brand?.brand_name ?? ""
        header.label7.text = productShow?.product?.categories?[indexPath.row].category_name ?? ""
        header.title = productShow?.product?.product_name ?? ""
        header.prices = productShow?.product?.product_price ?? ""
        header.images = productShow?.product?.product_pic ?? ""
        header.is_favorite = ((productShow?.product?.is_favorite) != nil)
        header.id = productShow?.product?.id ?? ""
        let url = "http://salomat.colibri.tj/upload_product/"
        let completeURL = url + (productShow?.product?.product_pic ?? "")
        header.image.downloaded(from: completeURL)
        if productShow?.product?.is_favorite == true {
            header.favorite.setImage(UIImage(named: "heart"), for: .normal)
        }
        else {
            header.favorite.setImage(UIImage(named: "favorite"), for: .normal)
        }
        return header
        //}
//        else if kind == UICollectionView.elementKindSectionFooter {
//            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MedicineFooterCollectionReusableView.identifier, for: indexPath) as! MedicineFooterCollectionReusableView
//            return footer
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
