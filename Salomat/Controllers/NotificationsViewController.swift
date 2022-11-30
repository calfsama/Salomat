//
//  NotificationsViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 22/11/22.
//

import UIKit

class NotificationsViewController: UIViewController {
    var notificationCollectionView = NotificationCollectionView()
    
    lazy var notificationButton: UIButton = {
        var button = UIButton()
        button.setTitle("Уведомления", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(changeScroll2), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.235, green: 0.902, blue: 0.51, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy var notificationScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = view.bounds
        scroll.contentSize = CGSize(width: view.frame.size.width, height: 1500)
        scroll.backgroundColor = .white
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    
    lazy var newsButton: UIButton = {
        var button = UIButton()
        button.setTitle("Новости", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(changeScroll), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var newsScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = view.bounds
        scroll.contentSize = CGSize(width: view.frame.size.width, height: 2350)
        scroll.backgroundColor = .white
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    
    lazy var header: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }
    
    func conf() {
        view.addSubview(notificationScroll)
        notificationScroll.addSubview(notificationButton)
        notificationScroll.addSubview(newsButton)
        notificationScroll.addSubview(notificationCollectionView)
        
        NSLayoutConstraint.activate([
     
            notificationButton.topAnchor.constraint(equalTo: notificationScroll.topAnchor, constant: 20),
            notificationButton.leadingAnchor.constraint(equalTo: notificationScroll.leadingAnchor, constant: 16),
            notificationButton.heightAnchor.constraint(equalToConstant: 20),
            notificationButton.widthAnchor.constraint(equalToConstant: 100),
            
            newsButton.topAnchor.constraint(equalTo: notificationScroll.topAnchor,constant: 20),
            newsButton.leadingAnchor.constraint(equalTo: notificationButton.trailingAnchor, constant: 5),
            newsButton.widthAnchor.constraint(equalToConstant: 100),
            newsButton.heightAnchor.constraint(equalToConstant: 20),
            
            notificationCollectionView.topAnchor.constraint(equalTo: newsButton.bottomAnchor, constant: 20),
            notificationCollectionView.leadingAnchor.constraint(equalTo: notificationScroll.leadingAnchor),
            notificationCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configure() {
        view.addSubview(notificationScroll)
        notificationScroll.addSubview(notificationButton)
        notificationScroll.addSubview(newsButton)
        notificationScroll.addSubview(uiView)
        notificationScroll.addSubview(notificationCollectionView)
        newsButton.setTitleColor(UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1), for: .normal)
        notificationButton.setTitleColor(UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1), for: .normal)
        
        NSLayoutConstraint.activate([
    
            notificationButton.topAnchor.constraint(equalTo: notificationScroll.topAnchor, constant: 20),
            notificationButton.leadingAnchor.constraint(equalTo: notificationScroll.leadingAnchor, constant: 16),
            notificationButton.heightAnchor.constraint(equalToConstant: 20),
            notificationButton.widthAnchor.constraint(equalToConstant: 100),
            
            newsButton.topAnchor.constraint(equalTo: notificationScroll.topAnchor,constant: 20),
            newsButton.leadingAnchor.constraint(equalTo: notificationButton.trailingAnchor, constant: 5),
            newsButton.widthAnchor.constraint(equalToConstant: 100),
            newsButton.heightAnchor.constraint(equalToConstant: 20),
            
            uiView.topAnchor.constraint(equalTo: notificationButton.bottomAnchor, constant: 10),
            uiView.leadingAnchor.constraint(equalTo: notificationButton.leadingAnchor),
            uiView.heightAnchor.constraint(equalToConstant: 3),
            uiView.widthAnchor.constraint(equalToConstant: 100),
            
            notificationCollectionView.topAnchor.constraint(equalTo: newsButton.bottomAnchor, constant: 20),
            notificationCollectionView.leadingAnchor.constraint(equalTo: notificationScroll.leadingAnchor),
            notificationCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func congifureScroll() {
        view.addSubview(newsScroll)
        newsScroll.addSubview(notificationButton)
        newsScroll.addSubview(newsButton)
        newsScroll.addSubview(uiView)
        newsButton.setTitleColor(UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1), for: .normal)
        notificationButton.setTitleColor(UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1), for: .normal)
        
        NSLayoutConstraint.activate([
            
            notificationButton.topAnchor.constraint(equalTo: newsScroll.topAnchor, constant: 20),
            notificationButton.leadingAnchor.constraint(equalTo: newsScroll.leadingAnchor, constant: 16),
            notificationButton.heightAnchor.constraint(equalToConstant: 20),
            notificationButton.widthAnchor.constraint(equalToConstant: 100),
            
            newsButton.topAnchor.constraint(equalTo: newsScroll.topAnchor,constant: 20),
            newsButton.leadingAnchor.constraint(equalTo: notificationButton.trailingAnchor, constant: 5),
            newsButton.widthAnchor.constraint(equalToConstant: 100),
            newsButton.heightAnchor.constraint(equalToConstant: 20),
            
            uiView.topAnchor.constraint(equalTo: newsButton.bottomAnchor, constant: 10),
            uiView.leadingAnchor.constraint(equalTo: newsButton.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: newsButton.trailingAnchor),
            uiView.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    @objc func changeScroll() {
        congifureScroll()
    }
    
    @objc func changeScroll2() {
        configure()
    }
}
