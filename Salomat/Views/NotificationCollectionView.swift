//
//  NotificationCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 22/11/22.
//

import UIKit
import Kingfisher

class NotificationCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var notification: NotificationData?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(NotificationCollectionViewCell.self, forCellWithReuseIdentifier: NotificationCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension NotificationCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notification?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: NotificationCollectionViewCell.identifier, for: indexPath) as! NotificationCollectionViewCell
        cell.date.text = notification?[indexPath.row].created_at ?? ""
        cell.image.kf.setImage(with: URL(string: notification?[indexPath.row].image ?? ""))
        cell.title.text = notification?[indexPath.row].title ?? ""
        cell.subtitle.text = notification?[indexPath.row].body ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 400)
    }
}
