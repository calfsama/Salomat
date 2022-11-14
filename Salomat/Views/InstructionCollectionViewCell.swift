//
//  InstructionCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 11/11/22.
//

import UIKit

class InstructionCollectionViewCell: UICollectionViewCell {
    static let identifier = "InstructionCollectionViewCell"

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        configureConstraints()
    }
    
    func configureConstraints() {
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
