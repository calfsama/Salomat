//
//  MyOrdersViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 13/10/22.
//

import UIKit

class MyOrdersViewController: UIViewController {
    
    lazy var goods: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "Товар"
        label.textColor = UIColor(red: 0.118, green: 0.196, blue: 0.235, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var goodsss: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "Товар"
        label.textColor = UIColor(red: 0.118, green: 0.196, blue: 0.235, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1).cgColor
        button.setTitle("Доставлено", for: .normal)
        button.setTitleColor(UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1), for: .normal)
        button.layer.borderWidth = 1
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}
