//
//  InstructionCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 11/11/22.
//

import UIKit

class InstructionCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var instruction = [Instruction]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        register(InstructionCollectionViewCell.self, forCellWithReuseIdentifier: InstructionCollectionViewCell.identifier)
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(cells: [Instruction]) {
        self.instruction = cells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension InstructionCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return instruction.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: InstructionCollectionViewCell.identifier, for: indexPath) as! InstructionCollectionViewCell
        cell.title.text = instruction[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 3 * 0.93, height: collectionView.frame.size.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
           
        }
    }
}
