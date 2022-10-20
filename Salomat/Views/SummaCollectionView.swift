//
//  SummaCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 14/10/22.
//

import UIKit

class SummaCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(SummaCollectionViewCell.self, forCellWithReuseIdentifier: SummaCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SummaCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SummaCollectionViewCell.identifier, for: indexPath) as! SummaCollectionViewCell
        cell.total.text = "Общая сумма"
        cell.totalCount.text = "109 сомон"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
