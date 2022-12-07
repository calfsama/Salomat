//
//  TestReceiptViewController.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 27/11/22.
//

import UIKit
import Photos

class TestReceiptViewConttroller: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , UIImagePickerControllerDelegate  , UINavigationControllerDelegate
{
    @IBOutlet weak var myCollectionView: UICollectionView!//Define separate collectionview outlet with a different name than any parameter in any of the function
    
    var imagesArray = [UIImage]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    
    @IBAction func addPhoto(_ sender: AnyObject) {
        
        let picker:UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        
        picker.delegate = self
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        
        //cell.configurecell(imagesArray[indexPath.row])
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imagesArray.count ?? 0
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedimage = (info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage){
            imagesArray = [pickedimage]//Will store three selected images in your array
            myCollectionView.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
}
