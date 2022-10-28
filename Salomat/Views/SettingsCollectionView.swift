//
//  SettingsCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/10/22.
//

extension String {
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}

import UIKit

class SettingsCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var navigationController: UINavigationController
    var settings = [Settings]()

    init(nav: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.navigationController = nav as! UINavigationController
        super.init(frame: .zero, collectionViewLayout: layout)
        register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: SettingsCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 0
//        contentInset = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
        showsHorizontalScrollIndicator = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        func set(cells: [Settings]) {
            self.settings = cells
        }
}
extension SettingsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SettingsCollectionViewCell.identifier, for: indexPath) as! SettingsCollectionViewCell
        cell.parametr.text = settings[indexPath.row].title
        cell.image.image = UIImage(named: settings[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            let vc = PersonalInfoViewController()
            vc.title = "Личная информация"
            self.navigationController.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2 {
            let vc = MyOrdersViewController()
            vc.title = "Мои заказы"
            self.navigationController.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 3 {
            let vc = PhoneNumberViewController()
            vc.title = "Номер телефона"
            self.navigationController.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 4 {
            let vc = SafetyViewController()
            vc.title = "Безопасность"
            self.navigationController.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 5 {
            let vc = ProfileViewController()
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}
