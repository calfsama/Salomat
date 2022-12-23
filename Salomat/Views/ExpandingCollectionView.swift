//
//  ExpandingCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 22/12/22.
//

import UIKit

class ExpandingCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var condition: Bool = false
    var order: OrdersData?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(ExpandingCollectionViewCell.self, forCellWithReuseIdentifier: ExpandingCollectionViewCell.identifier)
        layout.minimumInteritemSpacing = 24
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ExpandingCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return order?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if condition == true {
            return (order?[section].products.count ?? 0) + 1
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = dequeueReusableCell(withReuseIdentifier: ExpandingCollectionViewCell.identifier, for: indexPath) as! ExpandingCollectionViewCell
            cell.id.text = order?[indexPath.section].order?.id ?? ""
            cell.condition.setTitle(order?[indexPath.section].status[0].status_text ?? "", for: .normal)
            cell.data.attributedText = order?[indexPath.section].order?.created_at?.html2Attributed
            return cell
        }
        else {
            let cell = dequeueReusableCell(withReuseIdentifier: ExpandingCollectionViewCell.identifier, for: indexPath) as! ExpandingCollectionViewCell
            cell.id.text = order?[indexPath.section].products[indexPath.row - 1].id ?? ""
//            cell.condition.setTitle(order?[indexPath.section].status[0].status_text ?? "", for: .normal)
//            cell.data.attributedText = order?[indexPath.section].order?.created_at?.html2Attributed
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 && condition == true {
            condition = false
            let sections = IndexSet.init(integer: indexPath.section)
            collectionView.reloadSections(sections)
        }
        else if indexPath.row == 0 && condition == false{
            condition = true
            let sections = IndexSet.init(integer: indexPath.section)
            collectionView.reloadSections(sections)
        }
    }
}
