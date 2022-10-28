//
//  MadicinesViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit

class MedicinesViewController: UIViewController {
    var medicinesCollectionView: MedicinesCollectionView!
    var network = NetworkService()
    var id: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchVitemin()
        medicinesCollectionView = MedicinesCollectionView(nav: self.navigationController!)
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(medicinesCollectionView)
        
        NSLayoutConstraint.activate([
            medicinesCollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            medicinesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            medicinesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            medicinesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchVitemin(){
        let urlString = "http://salomat.colibri.tj//sales?sales_id=\(id)&page=1&min_price=&max_price="
        self.network.sales(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.medicinesCollectionView.sales = response
//                print(result)
                self.medicinesCollectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }

}
