//
//  MainViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit
import SkeletonView

class MainViewController: UIViewController {
    var text: String = ""
    var url: String = ""
    var searchController = UISearchController(searchResultsController: SearchViewController())
    var medicinesCell = MedicinesCollectionViewCell()
    
    
    lazy var uiscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2350)
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var categoryCollectionView: CategoryCollectionView!
    var bannersCollectionView = BannerCollectionView()
    var itemsCollectionView: ItemsCollectionView!
    var bannerMedicineCollectionView: BannerMedicineCollectionView!
    var medicinalProductsCollectionView: MedicinalProductsCollectionView!
    var blogCollectionView: BlogCollectionView!
    var vitaminCollectionView: VitaminCollectionView!
    var badsCollectionView: BADCollectionView!
    var network = NetworkService()
    var product: ProdsOfTheDay?
    
    lazy var header: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    lazy var header2: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    lazy var header3: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    lazy var header4: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    lazy var label: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.text = "Товары дня"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var label2: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.text = "Лекарственные средства"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var label3: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.text = "Блог"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var label4: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        title.text = "Все статьи"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var header5: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    lazy var label5: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.text = "Витамины и БАД"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchFromApi()
        fetchData()
        fetchBlogData()
        fetchVitemin()
        fetchBanner()
        categoryCollectionView = CategoryCollectionView(nav: self.navigationController!)
        blogCollectionView = BlogCollectionView(nav: self.navigationController!)
        itemsCollectionView = ItemsCollectionView(nav: self.navigationController!)
        bannerMedicineCollectionView = BannerMedicineCollectionView(nav: self.navigationController!)
        medicinalProductsCollectionView = MedicinalProductsCollectionView(nav: self.navigationController!)
        vitaminCollectionView = VitaminCollectionView(nav: self.navigationController!)
        badsCollectionView = BADCollectionView(nav: self.navigationController!)
        configureConstraints()
        categoryCollectionView.set(cells: Categories.items())
        searchController.searchBar.setImage(UIImage(named: "log out"), for: .bookmark, state: .normal)
        //bannersCollectionView.set(cells: Banners.items())
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        //searchController.searchBar.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(showCategories))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Search"), style: .plain, target: self, action: #selector(searchContr))
    }
    
    @objc func openSearchController() {
        let vc = NotificationsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func openSearch() {
        searchController.searchBar.placeholder = ""
        searchBar.setImage(UIImage(named: "camera"), for: .bookmark, state: .normal)
        present(searchController, animated: true, completion: nil)
    }
    
    @objc func btnAction() {
        let vc = BlogListViewController()
        vc.title = "Блог"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnCollection() {
        let vc = TestTwoViewController()
        vc.title = "Блог"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func configureConstraints() {
        view.addSubview(uiscrollView)
        uiscrollView.addSubview(categoryCollectionView)
        uiscrollView.addSubview(bannersCollectionView)
        uiscrollView.addSubview(itemsCollectionView)
        uiscrollView.addSubview(bannerMedicineCollectionView)
        uiscrollView.addSubview(header)
        uiscrollView.addSubview(label)
        uiscrollView.addSubview(header2)
        uiscrollView.addSubview(label2)
        uiscrollView.addSubview(medicinalProductsCollectionView)
        uiscrollView.addSubview(header3)
        uiscrollView.addSubview(label3)
        uiscrollView.addSubview(blogCollectionView)
        uiscrollView.addSubview(header4)
        uiscrollView.addSubview(button)
        uiscrollView.addSubview(label4)
        uiscrollView.addSubview(header5)
        uiscrollView.addSubview(label5)
        uiscrollView.addSubview(vitaminCollectionView)
        uiscrollView.addSubview(badsCollectionView)
        
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: uiscrollView.topAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 120),
            categoryCollectionView.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            
            bannersCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 16),
            bannersCollectionView.heightAnchor.constraint(equalToConstant: 200),
            bannersCollectionView.widthAnchor.constraint(equalTo: uiscrollView.widthAnchor),
            
            header.heightAnchor.constraint(equalToConstant: 30),
            header.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            header.topAnchor.constraint(equalTo: bannersCollectionView.bottomAnchor, constant: 25),
            
            label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: header.topAnchor),
            
            itemsCollectionView.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            itemsCollectionView.heightAnchor.constraint(equalToConstant: 300),
            itemsCollectionView.topAnchor.constraint(equalTo: header.bottomAnchor),
            
            header2.topAnchor.constraint(equalTo: itemsCollectionView.bottomAnchor, constant: 20),
            header2.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            header2.heightAnchor.constraint(equalToConstant: 30),
            
            label2.topAnchor.constraint(equalTo: header2.topAnchor),
            label2.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            bannerMedicineCollectionView.topAnchor.constraint(equalTo: header2.bottomAnchor),
            bannerMedicineCollectionView.widthAnchor.constraint(equalTo: uiscrollView.widthAnchor),
            bannerMedicineCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            medicinalProductsCollectionView.topAnchor.constraint(equalTo: bannerMedicineCollectionView.bottomAnchor, constant: 10),
            medicinalProductsCollectionView.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            medicinalProductsCollectionView.heightAnchor.constraint(equalToConstant: 300),
            
            header3.topAnchor.constraint(equalTo: medicinalProductsCollectionView.bottomAnchor, constant: 20),
            header3.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            header3.heightAnchor.constraint(equalToConstant: 30),
            
            label3.topAnchor.constraint(equalTo: header3.topAnchor),
            label3.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            blogCollectionView.topAnchor.constraint(equalTo: header3.bottomAnchor, constant: 20),
            blogCollectionView.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor),
            blogCollectionView.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            blogCollectionView.heightAnchor.constraint(equalToConstant: 400),
            
            header4.topAnchor.constraint(equalTo: blogCollectionView.bottomAnchor, constant: 16),
            header4.heightAnchor.constraint(equalToConstant: 30),

            button.topAnchor.constraint(equalTo: header4.topAnchor),
            button.bottomAnchor.constraint(equalTo: header4.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            button.widthAnchor.constraint(equalToConstant: 120),

            label4.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            label4.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            
            header5.topAnchor.constraint(equalTo: header4.bottomAnchor, constant: 35),
            header5.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            header5.heightAnchor.constraint(equalToConstant: 30),
            
            label5.topAnchor.constraint(equalTo: header5.topAnchor),
            label5.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            vitaminCollectionView.topAnchor.constraint(equalTo: header5.bottomAnchor),
            vitaminCollectionView.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            vitaminCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            badsCollectionView.topAnchor.constraint(equalTo: vitaminCollectionView.bottomAnchor),
            badsCollectionView.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width),
            badsCollectionView.heightAnchor.constraint(equalToConstant: 285)
        ])
    }
    
    @objc func showCategories() {
        let vc =  BlackViewController()
        vc.title = "Каталог товаров"
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *) {

            if let presentationController = navigationController.presentationController as? UISheetPresentationController {

                presentationController.detents =  [.medium(), .large()]
                self.present(navigationController, animated: true)
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    @objc func searchContr() {
        let vc = SearchProductViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchFromApi(){
        let urlString = "http://slomat2.colibri.tj/products/prods_of_the_day?"
        self.network.fetchData(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.itemsCollectionView.isSkeletonable = true
                self.itemsCollectionView.startSkeletonAnimation()
                self.itemsCollectionView.product = response
//                print(result)
                self.itemsCollectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    func fetchData(){
        let urlString = "http://slomat2.colibri.tj/products/categories_for_main_page?"
        self.network.fetchFromApi(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.medicinalProductsCollectionView.categories = response
                self.bannerMedicineCollectionView.banner = response
                self.vitaminCollectionView.banner = response
//                print(result)
                self.medicinalProductsCollectionView.reloadData()
                self.bannerMedicineCollectionView.reloadData()
                self.vitaminCollectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    func fetchBlogData(){
        let urlString = "http://slomat2.colibri.tj/blogs/blog_popular?page=1"
        self.network.fetchBlogsData(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.blogCollectionView.blogs = response
//                print(result)
                self.blogCollectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    
    func fetchVitemin(){
        let urlString = "http://slomat2.colibri.tj/products/categories_for_main_page?id=8"
        self.network.fetchFromApi(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.badsCollectionView.vitamin = response
//                print(result)
                self.badsCollectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    func fetchBanner(){
        let urlString = "http://slomat2.colibri.tj/products/main_sliders"
        self.network.fetchBanners(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.bannersCollectionView.banners = response
//                print(result)
                self.bannersCollectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    @objc func action() {
        let vc = CategoriesViewController()
        if #available(iOS 15.0, *) {
            if let sheet = vc.sheetPresentationController {
                sheet.detents = [.large(), .medium()]
            }
        } else {
            // Fallback on earlier versions
        }
        present(vc, animated: true, completion: nil)
    }

}
extension MainViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let vc = SearchViewController()
        vc.searchText = searchBar.text!
       // vc.searchData?.data?.srch_inp = searchBar.text!
        print(searchBar.text!)
        vc.title = "\(searchBar.text!)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

