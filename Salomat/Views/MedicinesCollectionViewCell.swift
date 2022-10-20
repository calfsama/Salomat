//
//  MadicinesCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit
import CoreData

class MedicinesCollectionViewCell: UICollectionViewCell {
    var condition: Bool = false
    var dataModel = [DataModel]()
    var titleMedicine: String = ""
    var images: String = ""
    var prices: String = ""
    var commitPredicate: NSPredicate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let identifier = "MedicinesCollectionViewCell"
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.frame = CGRect(x: 40, y: 40, width: 95, height: 95)
        image.translatesAutoresizingMaskIntoConstraints = true
        return image
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        title.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        title.numberOfLines = 2
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 140, y: 20, width: 23, height: 21)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "iconHeart"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var price: UILabel = {
        let price = UILabel()
        price.textColor = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        price.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        contentView.layer.borderColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1).cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
    }
    
    func configureConstraints() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(button)
        contentView.addSubview(price)
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction() {
        if condition == false {
            condition = true
            print("Clicked")
            button.setImage(UIImage(named: "heart"), for: .normal)
        }
        else if condition == true {
            condition = false
            button.setImage(UIImage(named: "iconHeart"), for: .normal)
        }

    }
    
//    func saveMedicine() {
//        let data = DataModel(context: self.context)
//        data.title = titleMedicine
//        data.price = prices
//        data.image = images
//        print(images)
//        self.dataModel.append(data)
//        print("ischecked")
//       do {
//           try context.save()
//       }catch {
//           print("Error saving context \(error)")
//       }
//    }
//
//    func buttonState() {
//        let fetchRequest: NSFetchRequest <DataModel> = DataModel.fetchRequest()
//        fetchRequest.predicate = commitPredicate
//        commitPredicate = NSPredicate(format: "title == %@", titleMedicine)
//        do {
//            let data = try context.fetch(fetchRequest)
//            for i in data {
//                if i.title == titleMedicine {
//                    //print("\(i.title) and \(title)")
//                    button.setImage(UIImage(named: "heart"), for: .normal)
//                }
//                else if i.title == nil{
//                    button.setImage(UIImage(named: "iconHeart"), for: .normal)
//                }
//            }
//        }
//        catch {
//            print("Error\(error)")
//        }
//    }
//
//    func deleteMedicine() {
//        let object: NSFetchRequest <DataModel> = DataModel.fetchRequest()
//        object.predicate = commitPredicate
//        commitPredicate = NSPredicate(format: "title == %@", titleMedicine)
//        do {
//            let object = try context.fetch(object)
//            for i in object {
//                if i.title == titleMedicine {
//                    context.delete(i)
//                }
//                do {
//                    try context.save()
//                }catch {
//                    print("Error1 \(error)")
//                }
//            }
//        }
//        catch {
//            print("Error2 \(error)")
//        }
//    }
//
//    @objc func buttonAction() {
//        let fetchRequest: NSFetchRequest <DataModel> = DataModel.fetchRequest()
//        fetchRequest.predicate = commitPredicate
//        commitPredicate = NSPredicate(format: "title == %@", titleMedicine)
//        do{
//            let data = try context.fetch(fetchRequest).first
//            if data == nil && data?.title != medicineCollectionViewCell.title {
//                print("\(data?.title) and \(medicineCollectionViewCell.title)")
//                button.setImage(UIImage(named: "heart"), for: .normal)
//                print("save")
//                saveMedicine()
//            }
//            else if data?.title == titleMedicine{
//                button.setImage(UIImage(named: "iconHeart"), for: .normal)
//                print("delete")
//                deleteMedicine()
//            }
//        }
//        catch {
//            print("Error1\(error)")
//        }
//    }
}
