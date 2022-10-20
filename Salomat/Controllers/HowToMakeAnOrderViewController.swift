//
//  HowToMakeAnOrderViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 23/09/22.
//

import UIKit

class HowToMakeAnOrderViewController: UIViewController {
    
    lazy var uiscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2500)
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "1. Войти или зарегистрироваться"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Перейдите на страницу личного кабинета (иконка профиля) через навигационное поле внизу. Войдите или зарегистрируйте по номеру телефона:"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "0")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var label3: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "2. Добавьте товар в “Корзину”"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label4: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "На странице товара выберете количество единиц товра и нажмите на кнопку “Купить”:"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 1-1")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var label5: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "3. Перейти в корзину"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label6: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Для оформления заказа вернитесь на главную страницу, нажмите на иконку корзины в навигационном поле и перейдите в корзину:"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 2.0")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var label7: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "4. Проверить заказ"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label8: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Проверьте заказ. Измените количество, отложите или удалите товар, если ошиблись с выбором. Как убедитесь, что все правильно, оформляйте заказ:"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 3")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var label9: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "5. Выбрать адрес доставки"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label10: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Заполните пустые поля по информации о доставке. В комментарии можете написать дополнительную информацию для облегчения работы курьера:"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image5: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 4")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var label11: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "После поступления заказанных товаров курьер свяжется с вами для уточнения даты и времени доставки."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label12: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "С деталями оплаты можете ознакомиться"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("тут.", for: .normal)
        button.frame = CGRect(x: 20, y: 20, width: 10, height: 5)
        button.setTitleColor(UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1), for: .normal)
        //button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uiscrollView)
        configureConstraints()
    }
    
    func configureConstraints() {
        uiscrollView.addSubview(label)
        uiscrollView.addSubview(label2)
        uiscrollView.addSubview(image)
        uiscrollView.addSubview(label3)
        uiscrollView.addSubview(label4)
        uiscrollView.addSubview(image2)
        uiscrollView.addSubview(label5)
        uiscrollView.addSubview(label6)
        uiscrollView.addSubview(image3)
        uiscrollView.addSubview(label7)
        uiscrollView.addSubview(label8)
        uiscrollView.addSubview(image4)
        uiscrollView.addSubview(label9)
        uiscrollView.addSubview(label10)
        uiscrollView.addSubview(image5)
        uiscrollView.addSubview(label11)
        uiscrollView.addSubview(label12)
//        uiscrollView.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: uiscrollView.topAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            label2.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            label2.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image.heightAnchor.constraint(equalToConstant: 320),
            image.widthAnchor.constraint(equalToConstant: 330),
            image.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 16),
            image.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),

            label3.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 24),
            label3.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 5),
            label4.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            label4.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image2.heightAnchor.constraint(equalToConstant: 280),
            image2.widthAnchor.constraint(equalToConstant: 330),
            image2.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 16),
            image2.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image2.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label5.topAnchor.constraint(equalTo: image2.bottomAnchor, constant: 24),
            label5.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 5),
            label6.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            label6.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image3.heightAnchor.constraint(equalToConstant: 280),
            image3.widthAnchor.constraint(equalToConstant: 330),
            image3.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 16),
            image3.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image3.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label7.topAnchor.constraint(equalTo: image3.bottomAnchor, constant: 24),
            label7.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label8.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 5),
            label8.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            label8.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image4.heightAnchor.constraint(equalToConstant: 360),
            image4.widthAnchor.constraint(equalToConstant: 330),
            image4.topAnchor.constraint(equalTo: label8.bottomAnchor, constant: 16),
            image4.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image4.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label9.topAnchor.constraint(equalTo: image4.bottomAnchor, constant: 24),
            label9.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label10.topAnchor.constraint(equalTo: label9.bottomAnchor, constant: 5),
            label10.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            label10.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            image5.heightAnchor.constraint(equalToConstant: 600),
            image5.widthAnchor.constraint(equalToConstant: 330),
            image5.topAnchor.constraint(equalTo: label10.bottomAnchor, constant: 16),
            image5.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            image5.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label11.topAnchor.constraint(equalTo: image5.bottomAnchor, constant: 24),
            label11.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            label11.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
            label12.topAnchor.constraint(equalTo: label11.bottomAnchor, constant: 1),
            label12.centerXAnchor.constraint(equalTo: uiscrollView.centerXAnchor),
            label12.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor, constant: 16),
            
//            button.topAnchor.constraint(equalTo: label11.bottomAnchor, constant: 1),
//            button.leadingAnchor.constraint(equalTo: label12.leadingAnchor, constant: 200),
//            button.heightAnchor.constraint(equalToConstant: 5),
//            button.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
}
