//
//  ExpandingViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 20/12/22.
//

import UIKit

class ExpandingViewController: UIViewController  {
    
    struct CellData {
        var opened: Bool
        var title: String
        var sectionData: [String]
    }
    
    var viewData = [CellData]()
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
                let displayHeight: CGFloat = self.view.frame.height

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
        tableView.register(ExpandingTableViewCell.self, forCellReuseIdentifier: ExpandingTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        viewData = [CellData(opened: false, title: "jm", sectionData: ["knfkn", "kdmfk", "wekmfk"]),
                    CellData(opened: false, title: "jk", sectionData: ["knfkn", "kdmfk", "wekmfk"]),
                    CellData(opened: false, title: "jh", sectionData: ["knfkn", "kdmfk", "wekmfk"])]
        
        view.addSubview(tableView)
    }
  
}
extension ExpandingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewData[section].opened == true {
            return viewData[section].sectionData.count + 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExpandingTableViewCell.identifier, for: indexPath) as! ExpandingTableViewCell
            cell.configure()
            cell.title.text = viewData[indexPath.section].title
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExpandingTableViewCell.identifier, for: indexPath) as! ExpandingTableViewCell
            cell.configure()
            cell.title.text = viewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && viewData[indexPath.section].opened == true {
            viewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
        else if indexPath.row == 0 && viewData[indexPath.section].opened == false{
            viewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
}
