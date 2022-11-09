//
//  BasketCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 10/10/22.
//

import UIKit
import CoreData

class CartCollectionViewCell: UICollectionViewCell {
    static let identifier = "BasketCollectionViewCell"
    var dataModel = [Basket]()
    var id: String = ""
    var is_favorite: Bool = false
    var titleMedicine: String = ""
    var images: String = ""
    var prices: String = ""
    var commitPredicate: NSPredicate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font =
        UIFont.systemFont(ofSize: 12, weight: .semibold)
        title.textColor =  UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var ml: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var art: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 100
        stepper.value = 1
        //stepper.setDecrementImage(UIImage(named: "minus"), for: .normal)
        //stepper.setIncrementImage(UIImage(named: "plus"), for: .normal)
        stepper.tintColor = UIColor(red: 0.738, green: 0.741, blue: 1, alpha: 1)
        stepper.tintColorDidChange()
        stepper.transform = stepper.transform.scaledBy(x: 0.8, y: 0.7)
        stepper.addTarget(self, action: #selector(update), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stepperValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "\(Int(stepper.value))"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1).cgColor
        configureConstraints()
    }
    
    func configureConstraints() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(ml)
        contentView.addSubview(art)
        contentView.addSubview(stepper)
        contentView.addSubview(stepperValue)
        contentView.addSubview(price)
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50),
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            
            ml.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 3),
            ml.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            
            art.topAnchor.constraint(equalTo: ml.bottomAnchor, constant: 3),
            art.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            
            stepper.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stepper.trailingAnchor.constraint(equalTo: price.leadingAnchor, constant: -10),

            stepperValue.centerYAnchor.constraint(equalTo: stepper.centerYAnchor),
            stepperValue.centerXAnchor.constraint(equalTo: stepper.centerXAnchor),
            
            price.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26)
        ])
    }
    
    @objc func update() {
        stepperValue.text = "\(Int(stepper.value))"
        price.text = "\((Int() ?? 2 * Int(stepper.value)))"
        print(stepper.value)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    func saveMedicine() {
//        let data = Basket(context: self.context)
//        data.id = id
//        data.title = titleMedicine
//        data.price = prices
//        data.image = images
//        print(images)
//        print(titleMedicine)
//        self.dataModel.append(data)
//        print("ischecked")
//       do {
//           try context.save()
//       }catch {
//           print("Error saving context \(error)")
//       }
//    }
//
////    func buttonState() {
////        let fetchRequest: NSFetchRequest <Basket> = Basket.fetchRequest()
////        fetchRequest.predicate = commitPredicate
////        commitPredicate = NSPredicate(format: "id == %@", id)
////        do {
////            let data = try context.fetch(fetchRequest)
////            for i in data {
////                if i.id == id {
////                    //print("\(i.title) and \(title)")
////                    button.setImage(UIImage(named: "heart"), for: .normal)
////                }
////                else if i.id == nil{
////                    button.setImage(UIImage(named: "iconHeart"), for: .normal)
////                }
////            }
////        }
////        catch {
////            print("Error\(error)")
////        }
////    }
//
//    func deleteMedicine() {
//        let object: NSFetchRequest <Basket> = Basket.fetchRequest()
//        object.predicate = commitPredicate
//        commitPredicate = NSPredicate(format: "id == %@", id)
//        do {
//            let object = try context.fetch(object)
//            for i in object {
//                if i.id == id {
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
//        let fetchRequest: NSFetchRequest <Basket> = Basket.fetchRequest()
//        fetchRequest.predicate = commitPredicate
//        commitPredicate = NSPredicate(format: "id == %@", id)
//        do{
//            let data = try context.fetch(fetchRequest).first
//            if data == nil && data?.id != id {
//                print("\(data?.id) and \(id)")
//                print("save")
//                saveMedicine()
//            }
//            else if data?.id == id{
//                print("delete")
//                deleteMedicine()
//            }
//        }
//        catch {
//            print("Error1\(error)")
//        }
//    }
}