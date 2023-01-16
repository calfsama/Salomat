//
//  SliderViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 04/11/22.
//

import UIKit

class SliderViewController: UIViewController {
   var popularCondition: Bool = false
   var collectionView = SearchCollectionView()
   var notPopularCondition: Bool = false
   var searchProduct: String = ""
   var network = NetworkService()
   var controller = SearchProductViewController()
   
   // Создание объектов
   
   lazy var uiview: UIView = {
      let uiview = UIView()
      uiview.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
      uiview.layer.cornerRadius = 4
      uiview.translatesAutoresizingMaskIntoConstraints = false
      return uiview
   }()
   
   lazy var price: UILabel = {
      let label = UILabel()
      label.text = "Цена"
      label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   lazy var raiting: UILabel = {
      let label = UILabel()
      label.text = "Рейтинг"
      label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   lazy var popularButton: UIButton = {
      let button =  UIButton()
      button.setImage(UIImage(named: "Radiobutton 1"), for: .normal)
      button.addTarget(self, action: #selector(actionForPopularButton), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }()
   
   lazy var popular: UILabel = {
      let label = UILabel()
      label.text = "популярные"
      label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   lazy var notPopularButton: UIButton = {
      let button =  UIButton()
      button.setImage(UIImage(named: "Radiobutton 1"), for: .normal)
      button.addTarget(self, action: #selector(actionForNotPopularButton), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }()
   
   lazy var notPopular: UILabel = {
      let label = UILabel()
      label.text = "непопулярные"
      label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
   }()
   
   lazy var showButton: UIButton = {
      let button = UIButton()
      button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
      button.setTitle("Показать", for: .normal)
      button.setTitleColor(.white, for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
      button.layer.cornerRadius = 4
    
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }()
   
    let slider = DoubledSlider()

    override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = .white
       configureConstraints()
       slider.minimumValue = 1
       slider.maximumValue = 200
       slider.addTarget(self, action: #selector(self.didChangeSliderValue), for: .valueChanged)
       slider.translatesAutoresizingMaskIntoConstraints = false
    }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      showButton.addTarget(self, action: #selector(search), for: .touchUpInside)
   }
   
   // Констрейнты
   func configureConstraints() {
      view.addSubview(uiview)
      view.addSubview(price)
      view.addSubview(slider)
      view.addSubview(raiting)
      view.addSubview(popularButton)
      view.addSubview(popular)
      view.addSubview(notPopularButton)
      view.addSubview(notPopular)
      view.addSubview(showButton)
      
      NSLayoutConstraint.activate([
         uiview.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 5),
         uiview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         uiview.heightAnchor.constraint(equalToConstant: 5),
         uiview.widthAnchor.constraint(equalToConstant: 100),
         
         price.topAnchor.constraint(equalTo: uiview.bottomAnchor, constant: 20),
         price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         
         slider.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 20),
         slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
         raiting.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 25),
         raiting.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         
         popularButton.topAnchor.constraint(equalTo: raiting.bottomAnchor, constant: 20),
         popularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         popularButton.heightAnchor.constraint(equalToConstant: 20),
         popularButton.widthAnchor.constraint(equalToConstant: 20),
         
         popular.leadingAnchor.constraint(equalTo: popularButton.trailingAnchor, constant: 5),
         popular.topAnchor.constraint(equalTo: raiting.bottomAnchor, constant: 20),
         
         notPopularButton.topAnchor.constraint(equalTo: raiting.bottomAnchor, constant: 20),
         notPopularButton.leadingAnchor.constraint(equalTo: popular.trailingAnchor, constant: 25),
         notPopularButton.heightAnchor.constraint(equalToConstant: 20),
         notPopularButton.widthAnchor.constraint(equalToConstant: 20),
         
         notPopular.topAnchor.constraint(equalTo: raiting.bottomAnchor, constant: 20),
         notPopular.leadingAnchor.constraint(equalTo: notPopularButton.trailingAnchor, constant: 5),
         
         showButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -35),
         showButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         showButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
         showButton.heightAnchor.constraint(equalToConstant: 45)
         
      ])
   }
   
   // Запрос по поиску препаратов по цене
   @objc func search() {
      let urlString = "http://slomat2.colibri.tj/search/with_price?srch_pr_inp=туба&min_price=\(self.slider.values.minimum)&max_price=\(self.slider.values.maximum)"
      print(searchProduct)
      print(self.slider.values.minimum)
      print(self.slider.values.maximum)
      let host = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
      self.network.search(urlString: host) { [weak self] (result) in
          guard let self = self else {return}
          switch result {
          case .success(let response):
            // self.collectionView.search = response
             self.controller.collectionView.search = response
             //print(self.collectionView.search ?? "cooontroller")
              //print(result)
             self.controller.collectionView.reloadData()
             //self.collectionView.reloadData()
             print(self.controller.collectionView.search ?? "controller collection view", "kfnek")
          case .failure(let error):
              print("error", error)
          }
      }
      hideView()
   }
   
    func hideView() {
      print("Hide")
      self.dismiss(animated: true, completion: nil)
   }
    
    @objc private func didChangeSliderValue() {
        print(self.slider.values.minimum)
        print(self.slider.values.maximum)
    }
   
   //Выбор препаратов по рейнтигу
   @objc func actionForPopularButton() {
      if popularCondition == false {
         popularCondition = true
         notPopularCondition = false
         notPopularButton.setImage(UIImage(named: "Radiobutton 1"), for: .normal)
         popularButton.setImage(UIImage(named: "Radiobutton 2"), for: .normal)
         print("Find popular")
      }
      else if popularCondition == true {
         popularCondition = false
         popularButton.setImage(UIImage(named: "Radiobutton 1"), for: .normal)
      }
   }
   
   @objc func actionForNotPopularButton() {
      if notPopularCondition == false {
         notPopularCondition = true
         popularCondition = false
         popularButton.setImage(UIImage(named: "Radiobutton 1"), for: .normal)
         notPopularButton.setImage(UIImage(named: "Radiobutton 2"), for: .normal)
         print("Find not popular")
      }
      else if notPopularCondition == true {
         notPopularCondition = false
         notPopularButton.setImage(UIImage(named: "Radiobutton 1"), for: .normal)
      }
   }
}
