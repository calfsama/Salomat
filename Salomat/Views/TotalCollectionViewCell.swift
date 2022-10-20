//
//  TotalCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 12/10/22.
//

import UIKit

class TotalCollectionViewCell: UICollectionViewCell {
    static let identifier = "TotalCollectionViewCell"
    
    lazy var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var costOfGoods: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Стоимость товаров:"
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var costOfDelivery: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Стоимость доставки:"
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cost: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var delivery: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var total: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.text = "Итого: "
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalCost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.text = "114 сом."
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.borderColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1).cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        configureConstraints()
    }
    
    func configureConstraints() {
        contentView.addSubview(costOfGoods)
        contentView.addSubview(costOfDelivery)
        contentView.addSubview(cost)
        contentView.addSubview(delivery)
        contentView.addSubview(uiView)
        contentView.addSubview(total)
        contentView.addSubview(totalCost)
        
        NSLayoutConstraint.activate([
            costOfGoods.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            costOfGoods.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            costOfDelivery.topAnchor.constraint(equalTo: costOfGoods.bottomAnchor, constant: 10),
            costOfDelivery.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            cost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            delivery.topAnchor.constraint(equalTo: cost.bottomAnchor, constant: 10),
            delivery.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            uiView.heightAnchor.constraint(equalToConstant: 1),
            uiView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
            uiView.topAnchor.constraint(equalTo: costOfDelivery.bottomAnchor, constant: 15),
            uiView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            total.topAnchor.constraint(equalTo: costOfDelivery.bottomAnchor, constant: 30),
            total.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            totalCost.topAnchor.constraint(equalTo: delivery.bottomAnchor, constant: 30),
            totalCost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
