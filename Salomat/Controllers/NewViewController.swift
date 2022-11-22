//
//  NewViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 21/11/22.
//

import UIKit

class NewViewController: UIViewController {
    var instruction = InstructionCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraints()
        instruction.set(cells: Instruction.items())
    }
    
    func configureConstraints() {
        view.addSubview(instruction)
        
        NSLayoutConstraint.activate([
            instruction.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            instruction.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            instruction.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
