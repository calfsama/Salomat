//
//  AboutProjectViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 21/09/22.
//

import UIKit

class AboutProjectViewController: UIViewController {
    
    lazy var uiscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1600)
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "banner")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var appName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.text = "SALOMAT.TJ"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var aboutApp: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.text = "— это молодая перспективная аптека,"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var aboutApp2: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.text = "работающая на стыке сферы информационных технологий и фармацевтики. Наша интернет-аптека это большой выбор медикаментов (более 5000 видов), товаров для здоровья и красоты; это онлайн - сервис по предоставлению интересующей информации о препаратах; это возможность найти, сравнить цены и конечно же выгодно приобрести нужные вам лекарства не выходя из дома или офиса!"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var number: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.text = "500 +"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var number2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.text = "100 +"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var number3: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.text = "1,2 млн +"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var brands: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.text = "брендов на сайте"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var orders: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.text = "заказов в день"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var visitors: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.text = "посетителей сайта"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var benefits: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.text = "Наши преимущества"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1-1")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var image3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2-1")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "3-1")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image5: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "4")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image6: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "5")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image7: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "6")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image8: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "7")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image9: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "8")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var partners: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.text = "Наши партнеры"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var logos: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logos")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uiscrollView)
        configureConstraints()
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
    }
   
    func configureConstraints() {
        uiscrollView.addSubview(image)
        uiscrollView.addSubview(appName)
        uiscrollView.addSubview(aboutApp)
        uiscrollView.addSubview(aboutApp2)
        uiscrollView.addSubview(number)
        uiscrollView.addSubview(number2)
        uiscrollView.addSubview(brands)
        uiscrollView.addSubview(orders)
        uiscrollView.addSubview(number3)
        uiscrollView.addSubview(visitors)
        uiscrollView.addSubview(benefits)
        uiscrollView.addSubview(image2)
        uiscrollView.addSubview(image3)
        uiscrollView.addSubview(image4)
        uiscrollView.addSubview(image5)
        uiscrollView.addSubview(image6)
        uiscrollView.addSubview(image7)
        uiscrollView.addSubview(image8)
        uiscrollView.addSubview(image9)
        uiscrollView.addSubview(partners)
        uiscrollView.addSubview(logos)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: uiscrollView.topAnchor, constant: 25),
            image.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            appName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25),
            appName.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            aboutApp.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25),
            aboutApp.leadingAnchor.constraint(equalTo: appName.trailingAnchor, constant: 2),
            
            aboutApp2.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 1),
            aboutApp2.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            aboutApp2.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            number.topAnchor.constraint(equalTo: aboutApp2.bottomAnchor, constant: 30),
            number.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            number2.topAnchor.constraint(equalTo: aboutApp2.bottomAnchor, constant: 30),
            number2.leadingAnchor.constraint(equalTo: number.trailingAnchor, constant: 80),
            
            brands.topAnchor.constraint(equalTo: number.bottomAnchor, constant: 2),
            brands.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 18),
            
            orders.topAnchor.constraint(equalTo: number2.bottomAnchor, constant: 2),
            orders.leadingAnchor.constraint(equalTo: number.trailingAnchor, constant: 82),
            
            number3.topAnchor.constraint(equalTo: brands.bottomAnchor, constant: 25),
            number3.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),

            visitors.topAnchor.constraint(equalTo: number3.bottomAnchor, constant: 2),
            visitors.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 18),

            benefits.topAnchor.constraint(equalTo: visitors.bottomAnchor, constant: 35),
            benefits.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image2.topAnchor.constraint(equalTo: benefits.bottomAnchor, constant: 16),
            image2.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            image2.heightAnchor.constraint(equalToConstant: 250),
            image2.widthAnchor.constraint(equalToConstant: 164),
            
            image3.topAnchor.constraint(equalTo: benefits.bottomAnchor, constant: 16),
            image3.leadingAnchor.constraint(equalTo: image2.trailingAnchor, constant: 16),
            image3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            image3.heightAnchor.constraint(equalToConstant: 180),
            image3.widthAnchor.constraint(equalToConstant: 164),
            
            image4.topAnchor.constraint(equalTo: image2.bottomAnchor, constant: 16),
            image4.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            image4.heightAnchor.constraint(equalToConstant: 180),
            image4.widthAnchor.constraint(equalToConstant: 164),
            
            image5.topAnchor.constraint(equalTo: image3.bottomAnchor, constant: 16),
            image5.leadingAnchor.constraint(equalTo: image4.trailingAnchor, constant: 16),
            image5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            image5.heightAnchor.constraint(equalToConstant: 150),
            image5.widthAnchor.constraint(equalToConstant: 164),
            
            image6.topAnchor.constraint(equalTo: image4.bottomAnchor, constant: 16),
            image6.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            image6.heightAnchor.constraint(equalToConstant: 150),
            image6.widthAnchor.constraint(equalToConstant: 164),
            
            image7.topAnchor.constraint(equalTo: image5.bottomAnchor, constant: 16),
            image7.leadingAnchor.constraint(equalTo: image6.trailingAnchor, constant: 16),
            image7.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            image7.heightAnchor.constraint(equalToConstant: 180),
            image7.widthAnchor.constraint(equalToConstant: 164),
            
            image8.topAnchor.constraint(equalTo: image6.bottomAnchor, constant: 16),
            image8.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            image8.heightAnchor.constraint(equalToConstant: 200),
            image8.widthAnchor.constraint(equalToConstant: 164),
            
            image9.topAnchor.constraint(equalTo: image7.bottomAnchor, constant: 16),
            image9.leadingAnchor.constraint(equalTo: image8.trailingAnchor, constant: 16),
            image9.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            image9.heightAnchor.constraint(equalToConstant: 150),
            image9.widthAnchor.constraint(equalToConstant: 164),
            
            partners.topAnchor.constraint(equalTo: image8.bottomAnchor, constant: 40),
            partners.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            logos.topAnchor.constraint(equalTo: partners.bottomAnchor, constant: 16),
            logos.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            logos.widthAnchor.constraint(equalToConstant: uiscrollView.frame.size.width - 35),
            logos.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
