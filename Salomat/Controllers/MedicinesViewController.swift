//
//  MadicinesViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit

class MedicinesViewController: UIViewController {
    var medicinesCollectionView = MedicinesCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
    }
    
    func configureConstraints() {
        view.addSubview(medicinesCollectionView)
        
        NSLayoutConstraint.activate([
            medicinesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 117),
            medicinesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            medicinesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            medicinesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
