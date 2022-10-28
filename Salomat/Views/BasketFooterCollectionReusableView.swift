//
//  BasketFooterCollectionReusableView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 25/10/22.
//

import UIKit

class BasketFooterCollectionReusableView: UICollectionReusableView {
    static let identifier = "BasketFooterCollectionReusableView"
    
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
    
    public func configure() {
        layer.borderColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        addSubview(costOfGoods)
        addSubview(costOfDelivery)
        addSubview(cost)
        addSubview(delivery)
        addSubview(uiView)
        addSubview(total)
        addSubview(totalCost)
        
        NSLayoutConstraint.activate([
            costOfGoods.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            costOfGoods.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            costOfDelivery.topAnchor.constraint(equalTo: costOfGoods.bottomAnchor, constant: 10),
            costOfDelivery.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cost.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cost.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            delivery.topAnchor.constraint(equalTo: cost.bottomAnchor, constant: 10),
            delivery.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            uiView.heightAnchor.constraint(equalToConstant: 1),
            uiView.widthAnchor.constraint(equalToConstant: frame.size.width),
            uiView.topAnchor.constraint(equalTo: costOfDelivery.bottomAnchor, constant: 15),
            uiView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            total.topAnchor.constraint(equalTo: costOfDelivery.bottomAnchor, constant: 30),
            total.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            totalCost.topAnchor.constraint(equalTo: delivery.bottomAnchor, constant: 30),
            totalCost.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
