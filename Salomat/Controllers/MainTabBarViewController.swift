//
//  MainTabBarViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 28/11/22.
//

import UIKit
import SwiftKeychainWrapper
import KeychainAccess

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let home = MainViewController()
        let homeNavigation = UINavigationController(rootViewController: home)
        let homeItem = UITabBarItem(title: "Главная", image: UIImage(named: "logo1"), selectedImage: UIImage(named: "inactive.profile"))
        homeNavigation.tabBarItem = homeItem
        
        let favorite = FavoritesViewController()
        let favoriteNavigation = UINavigationController(rootViewController: favorite)
        let favoriteItem = UITabBarItem(title: "Избранное", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
       
        favoriteNavigation.tabBarItem = favoriteItem
        
        let receipt = ReceiptViewController()
        let receiptNavigation = UINavigationController(rootViewController: receipt)
        let receiptItem = UITabBarItem(title: "е-рецепт", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        receiptNavigation.tabBarItem = receiptItem
        
        let cart = CartViewController()
        let cartNavigation = UINavigationController(rootViewController: cart)
        let cartItem = UITabBarItem(title: "Корзина", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        cartNavigation.tabBarItem = cartItem
        
        let profile = ProfileViewController()
        let profileNavigation = UINavigationController(rootViewController: profile)
        let profileItem = UITabBarItem(title: "Профиль", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        profileNavigation.tabBarItem = profileItem
        
        let profilePage = ProfileInfoViewController()
        let profilePageNavigation = UINavigationController(rootViewController: profilePage)
        let profilePageItem = UITabBarItem(title: "Профиль", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        profilePageNavigation.tabBarItem = profilePageItem
        
        let token = KeychainWrapper.standard.string(forKey: "ttoken")
        if token != nil {
            viewControllers = [homeNavigation, favoriteNavigation, receiptNavigation, cartNavigation, profilePageNavigation]
            //selectedIndex = 4
        }
        else if token == nil {
            viewControllers = [homeNavigation, favoriteNavigation, receiptNavigation, cartNavigation, profileNavigation]
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //print("Selected \(viewController.title!)")
    }

}
