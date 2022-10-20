//
//  ShippingAndPaymentViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 21/09/22.
//

import UIKit

class ShippingAndPaymentViewController: UIViewController {
    
    lazy var uiscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1320)
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "11")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var shipping: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.text = "Доставка и оплата"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "step 1")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "step 2")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "step 3")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var image5: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "step 4")
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
        uiscrollView.addSubview(shipping)
        uiscrollView.addSubview(image2)
        uiscrollView.addSubview(image3)
        uiscrollView.addSubview(image4)
        uiscrollView.addSubview(image5)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 210),
            image.widthAnchor.constraint(equalToConstant: 330),
            image.topAnchor.constraint(equalTo: uiscrollView.topAnchor, constant: 25),
            image.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),

            shipping.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25),
            shipping.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),

            image2.heightAnchor.constraint(equalToConstant: 130),
            image2.widthAnchor.constraint(equalToConstant: 330),
            image2.topAnchor.constraint(equalTo: shipping.bottomAnchor, constant: 16),
            image2.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image2.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image3.heightAnchor.constraint(equalToConstant: 250),
            image3.widthAnchor.constraint(equalToConstant: 330),
            image3.topAnchor.constraint(equalTo: image2.bottomAnchor, constant: 16),
            image3.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image3.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image4.heightAnchor.constraint(equalToConstant: 150),
            image4.widthAnchor.constraint(equalToConstant: 330),
            image4.topAnchor.constraint(equalTo: image3.bottomAnchor, constant: 16),
            image4.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image4.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image5.heightAnchor.constraint(equalToConstant: 420),
            image5.widthAnchor.constraint(equalToConstant: 330),
            image5.topAnchor.constraint(equalTo: image4.bottomAnchor, constant: 16),
            image5.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image5.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
        ])
    }
}
