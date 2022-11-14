//
//  MadicinesCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 01/09/22.
//

import UIKit
import CoreData
import SkeletonView

class MedicinesCollectionViewCell: UICollectionViewCell {
    var index: IndexPath!
    var indexPath: Int = 0
    var favoritesModel: FavoritesData?
    var condition: Bool = false
    var dataBasket = [Basket]()
    var dataModel = [DataModel]()
    var id: String = ""
    var is_favorite: Bool = false
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
    
    lazy var cartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1)
        button.setTitle("в корзину", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(saveInBasket), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        image.isSkeletonable = true
        title.isSkeletonable = true
        button.isSkeletonable = true
        price.isSkeletonable = true
        cartButton.isSkeletonable = true
        contentView.skeletonCornerRadius = 10
        contentView.isSkeletonable = true
        //contentView.startSkeletonAnimation()
    
    }
    
    func configureConstraints() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(button)
        contentView.addSubview(price)
        contentView.addSubview(cartButton)
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            price.bottomAnchor.constraint(equalTo: cartButton.topAnchor, constant: -15),
            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            cartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cartButton.heightAnchor.constraint(equalToConstant: 28),
            cartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func saveMedicine() {
        let data = DataModel(context: self.context)
        data.id = id
        data.is_favorite = true
        data.title = titleMedicine
        data.price = prices
        data.image = images
        self.dataModel.append(data)
        print("ischecked")
       do {
           try context.save()
       }catch {
           print("Error saving context \(error)")
       }
    }

    func buttonState() {
        let fetchRequest: NSFetchRequest <DataModel> = DataModel.fetchRequest()
        fetchRequest.predicate = commitPredicate
        commitPredicate = NSPredicate(format: "id == %@", id)
        do {
            let data = try context.fetch(fetchRequest)
            for i in data {
                if i.id == id {
                    //print("\(i.title) and \(title)")
                    button.setImage(UIImage(named: "heart"), for: .normal)
                }
                else if i.id == nil{
                    button.setImage(UIImage(named: "iconHeart"), for: .normal)
                }
            }
        }
        catch {
            print("Error\(error)")
        }
    }

    func deleteMedicine() {
        let object: NSFetchRequest <DataModel> = DataModel.fetchRequest()
        object.predicate = commitPredicate
        commitPredicate = NSPredicate(format: "id == %@", id)
        do {
            let object = try context.fetch(object)
            for i in object {
                if i.id == id {
                    context.delete(i)
                }
                do {
                    try context.save()
                }catch {
                    print("Error1 \(error)")
                }
            }
        }
        catch {
            print("Error2 \(error)")
        }
    }

    @objc func buttonAction() {
        let fetchRequest: NSFetchRequest <DataModel> = DataModel.fetchRequest()
        commitPredicate = NSPredicate(format: "id == %@", id)
        fetchRequest.predicate = commitPredicate
        do{
            let data = try context.fetch(fetchRequest).first
            if  data?.id != id {
                print("\(data?.id) and \(id)")
                button.setImage(UIImage(named: "heart"), for: .normal)
                print("save")
                addFavorites()
                saveMedicine()
            }
            else if data?.id == id{
                button.setImage(UIImage(named: "iconHeart"), for: .normal)
                print("delete")
                deleteFavorites()
                deleteMedicine()
            }
        }
        catch {
            print("Error1\(error)")
        }
    }
    
    func saveMedicineInBasket() {
        let data = Basket(context: self.context)
        data.id = id
        data.title = titleMedicine
        data.price = prices
        data.image = images
        print(images)
        print(title)
        self.dataBasket.append(data)
        print("ischecked")
       do {
           try context.save()
       }catch {
           print("Error saving context \(error)")
       }
    }

    func deleteMedicineInBasket() {
        let object: NSFetchRequest <Basket> = Basket.fetchRequest()
        object.predicate = commitPredicate
        commitPredicate = NSPredicate(format: "id == %@", id)
        do {
            let object = try context.fetch(object)
            for i in object {
                if i.id == id {
                    context.delete(i)
                }
                do {
                    try context.save()
                }catch {
                    print("Error1 \(error)")
                }
            }
        }
        catch {
            print("Error2 \(error)")
        }
    }
    
    @objc func saveInBasket() {
        let fetchRequest: NSFetchRequest <Basket> = Basket.fetchRequest()
        fetchRequest.predicate = commitPredicate
        commitPredicate = NSPredicate(format: "title == %@", titleMedicine)
        do{
            let data = try context.fetch(fetchRequest).first
            if data == nil && data?.title != titleMedicine {
                print("\(data?.title) and \(titleMedicine)")
                print("save")
                saveMedicineInBasket()
            }
            else if data?.title == titleMedicine {
                print("\(data?.title) and \(titleMedicine)")
                print("delete")
                deleteMedicineInBasket()
            }
        }
        catch {
            print("Error1\(error)")
        }
    }
    
    
    func addFavorites() {
        guard let url = URL(string: "http://salomat.colibri.tj/favorites") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "user_id": "15",
            "product_id": id
        ]
            request.httpBody = parameters.percentEncoded()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                error == nil
                    
            else {                                                                //check for fundamental networking error
                print("error", error ?? URLError(.badServerResponse))
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            }
            catch {
                print(error)
            }
         
        
            guard (200 ... 299) ~= response.statusCode else {                     //check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
        }
        task.resume()
    }
    
    func deleteFavorites() {
        guard let url = URL(string: "http://salomat.colibri.tj/favorites/delete") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "user_id": "15",
            "product_id": id
        ]
            request.httpBody = parameters.percentEncoded()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                error == nil
                    
            else {                                                                //check for fundamental networking error
                print("error", error ?? URLError(.badServerResponse))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            }
            catch {
                print(error)
            }
         
        
            guard (200 ... 299) ~= response.statusCode else {                     //check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
        }
        task.resume()
    }

}
