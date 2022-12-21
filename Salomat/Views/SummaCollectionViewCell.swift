//
//  SummaCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 14/10/22.
//

import UIKit
import CoreData

class SummaCollectionViewCell: UICollectionViewCell {
    static let identifier = "SummaCollectionViewCell"
    var data = [Basket]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var total: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalCount: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        loadArticles()
    }
    
    func loadArticles() {
        let request: NSFetchRequest <Basket> = Basket.fetchRequest()
        do {
            data = try context.fetch(request)
            totalCount.text = String(format: "%.2f", calculateCartTotalWithDelivery())
        }catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    func calculateCartTotalWithDelivery() -> Double{
        var total = 0.0
        if self.data.count > 0 {
            for index in 0...self.data.count - 1 {
                total += (Double(data[index].price!) ?? 0)
            }
        }
        return total + 5
    }
    
    
    func configureConstraints() {
        contentView.addSubview(total)
        contentView.addSubview(totalCount)
        
        NSLayoutConstraint.activate([
            total.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            total.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            totalCount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            totalCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }   
}
