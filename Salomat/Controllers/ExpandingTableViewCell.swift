//
//  ExpandingTableViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 20/12/22.
//

import UIKit

class ExpandingTableViewCell: UITableViewCell {
    static let identifier = "ExpandingTableViewCell"
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "jm"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
}
