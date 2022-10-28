//
//  TestViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 27/10/22.
//

import UIKit

class TestViewController: UIViewController {
    lazy var text: UILabel = {
        let label = UILabel()
        label.text = "Will attempt to recover by breaking constraint<NSLayoutConstraint:0x600001868eb0 UIImageView:0x15b751470.centerX == UIView:0x15b751130.centerX   (active)>Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful."
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1), for: .normal)
        button.setTitle("more", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(text)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            text.topAnchor
                .constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func buttonAction() {
        if text.numberOfLines != 0 {
            text.numberOfLines = 0
            button.setTitle("less", for: .normal)
        }
        else if text.numberOfLines == 0 {
            text.numberOfLines = 3
            button.setTitle("more", for: .normal)
        }
    }
}
