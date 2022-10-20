//
//  ViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit

class ViewController: UIViewController {
    var categoryCollectionView: CategoryCollectionView!
    var bannersCollectionView = BannerCollectionView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.addSubview(contentView)
//        configureConstraints()
        categoryCollectionView = CategoryCollectionView(nav: self.navigationController!)
        categoryCollectionView.set(cells: Categories.items())
        //bannersCollectionView.set(cells: Banners.items())
    }
//    func configureConstraints() {
//        view.addSubview(categoryCollectionView)
//        view.addSubview(bannersCollectionView)
//
//        NSLayoutConstraint.activate([
//            categoryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
//            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            categoryCollectionView.heightAnchor.constraint(equalToConstant: 180),
//            categoryCollectionView.widthAnchor.constraint(equalToConstant: 300),
//
//            bannersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            bannersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            bannersCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 30),
//            bannersCollectionView.heightAnchor.constraint(equalToConstant: 200),
//            bannersCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor)
//
//        ])
//    }
}

