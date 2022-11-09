//
//  SliderViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 04/11/22.
//

import UIKit

class SliderViewController: UIViewController {
   var popularCondition: Bool = false
   var notPopularCondition: Bool = false
   
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
   
   func configureConstraints() {
      view.addSubview(price)
      view.addSubview(slider)
      view.addSubview(raiting)
      view.addSubview(popularButton)
      view.addSubview(popular)
      view.addSubview(notPopularButton)
      view.addSubview(notPopular)
      view.addSubview(showButton)
      
      NSLayoutConstraint.activate([
         price.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
         price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         
         slider.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 10),
         slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
         raiting.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
         raiting.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         
         popularButton.topAnchor.constraint(equalTo: raiting.bottomAnchor, constant: 10),
         popularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         popularButton.heightAnchor.constraint(equalToConstant: 20),
         popularButton.widthAnchor.constraint(equalToConstant: 20),
         
         popular.leadingAnchor.constraint(equalTo: popularButton.trailingAnchor, constant: 5),
         popular.topAnchor.constraint(equalTo: raiting.bottomAnchor, constant: 10),
         
         notPopularButton.topAnchor.constraint(equalTo: raiting.bottomAnchor, constant: 10),
         notPopularButton.leadingAnchor.constraint(equalTo: popular.trailingAnchor, constant: 25),
         notPopularButton.heightAnchor.constraint(equalToConstant: 20),
         notPopularButton.widthAnchor.constraint(equalToConstant: 20),
         
         notPopular.topAnchor.constraint(equalTo: raiting.bottomAnchor, constant: 10),
         notPopular.leadingAnchor.constraint(equalTo: notPopularButton.trailingAnchor, constant: 5),
         
         showButton.topAnchor.constraint(equalTo: popular.bottomAnchor, constant: 20),
         showButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         showButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
         showButton.heightAnchor.constraint(equalToConstant: 45)
         
      ])
   }
    
    @objc private func didChangeSliderValue() {
        print(self.slider.values.minimum)
        print(self.slider.values.maximum)
    }
   
   @objc func actionForPopularButton() {
      if popularCondition == false {
         popularCondition = true
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
         notPopularButton.setImage(UIImage(named: "Radiobutton 2"), for: .normal)
         print("Find not popular")
      }
      else if notPopularCondition == true {
         notPopularCondition = false
         notPopularButton.setImage(UIImage(named: "Radiobutton 1"), for: .normal)
      }
   }
}
