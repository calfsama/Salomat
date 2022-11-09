//
//  GroupCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/11/22.
//

import UIKit

class GroupCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: GroupCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension GroupCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.identifier, for: indexPath) as! GroupCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 5, height: collectionView.frame.size.height / 7)
    }
}
