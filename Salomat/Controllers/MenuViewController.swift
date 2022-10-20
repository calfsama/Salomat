//
//  MenuViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 21/09/22.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        createTheView()
    }
    
    private func createTheView() {

          let xCoord = self.view.bounds.width / 2 - 50
          let yCoord = self.view.bounds.height / 2 - 50

        let centeredView = UIView(frame: CGRect(x: 0, y: 400, width: view.frame.size.width, height: 500))
          centeredView.backgroundColor = .blue
          self.view.addSubview(centeredView)
      }
 
}
