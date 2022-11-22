//
//  BasketCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 10/10/22.
//

import UIKit

class CartCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var data = [Basket]()
    var cart = CartCollectionViewCell()
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(CartCollectionViewCell.self, forCellWithReuseIdentifier: CartCollectionViewCell.identifier)
        register(BasketFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BasketFooterCollectionReusableView.identifier)
        delegate = self
        dataSource = self
        layout.minimumLineSpacing = 0
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CartCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
//        if data.count == 0 {
//            image.image = UIImage(named: "Дизайн без названия-4")
//            collectionView.backgroundView = image
//            return 0
//        }
//        else {
//            image.image = UIImage(named: "")
//            collectionView.backgroundView = image
            return data.count
       
        //}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CartCollectionViewCell.identifier, for: indexPath) as! CartCollectionViewCell
        let url = "http://salomat.colibri.tj/upload_product/"
        let completeURL = url + (data[indexPath.row].image ?? "")
        cell.image.downloaded(from: completeURL)
        cell.title.text = data[indexPath.row].title
        cell.price.text = data[indexPath.row].price
        cell.price.text = String((cell.stepper.value) + Double(data[indexPath.row].price!)!)
        cell.prices = data[indexPath.row].price ?? ""
        //        cell.image.image = medical[indexPath.row].image
        //        cell.title.text = medical[indexPath.row].name
        //        cell.price.text = medical[indexPath.row].price
        cell.price.text = "\(cell.stepper.value * Double(data[indexPath.row].price ?? "")!) "
        cell.ml.text = "50 мл"
        cell.art.text = "Арт. 10120"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height / 9)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BasketFooterCollectionReusableView.identifier, for: indexPath) as! BasketFooterCollectionReusableView
        footer.cost.text = String(format: "%.2f", calculateCartTotal())
        footer.delivery.text = "10"
        footer.totalCost.text = String(format: "%.2f", calculateCartTotalWithDelivery())
        footer.configure()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 150)
    }
    
    func calculateCartTotal() -> Double{
        var total = 0.0
        if self.data.count > 0 {
            for index in 0...self.data.count - 1 {
                total += Double(data[index].price!) ?? 0
            }
        }
        return total
    }
    
    func calculateCartTotalWithDelivery() -> Double{
        var total = 0.0
        if self.data.count > 0 {
            for index in 0...self.data.count - 1 {
                total += (Double(data[index].price!) ?? 0)
                
            }
        }
        return total + 10
    }
    
    func displayTotal() {
        let cell = BasketFooterCollectionReusableView()
        cell.totalCost.text = "$" + String(format: "%.2f", calculateCartTotal())
    }
}
