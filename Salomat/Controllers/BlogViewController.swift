//
//  BjjjjViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 05/10/22.
//

import UIKit

class BlogViewController: UIViewController {
    var blogsShowCollectionView = BlogsShowCollectionView()
    var network = NetworkService()
    var id: String = ""
    
    lazy var uiscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 3200)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uiscrollView)
        fetchBlogData()
        configureConstraints()
    }
    
    func configureConstraints() {
        uiscrollView.addSubview(blogsShowCollectionView)
        
        NSLayoutConstraint.activate([
            blogsShowCollectionView.heightAnchor.constraint(equalToConstant: uiscrollView.frame.size.height + 3200),
            blogsShowCollectionView.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width)
        ])
    }
    
    func fetchBlogData(){
        let urlString = "http://salomat.colibri.tj/blogs/blog?blog_id=\(id)"
        self.network.show(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.blogsShowCollectionView.show = response
                print(result)
                self.blogsShowCollectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
