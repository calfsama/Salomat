//
//  BlogsShowCollectionView.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 05/10/22.
//

import UIKit
import CoreMIDI

class BlogsShowCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var blogs: Blog?
    var show: Show?
    var share: String = ""
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(BlogsShowCollectionViewCell.self, forCellWithReuseIdentifier: BlogsShowCollectionViewCell.identifier)
        indicator.frame = CGRect(x: 180, y: 280, width: 40, height: 40)
        indicator.color = UIColor(red: 0.282, green: 0.224, blue: 0.765, alpha: 1)
        indicator.startAnimating()
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension BlogsShowCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: BlogsShowCollectionViewCell.identifier, for: indexPath) as! BlogsShowCollectionViewCell
//        let data = blogs?.content?.blogs?[indexPath.row]
//        cell.title.text = data?.blog_title ?? ""
        cell.share.text = share
        cell.title.text = show?.blog?.blog_title ?? ""
        let url = "http://slomat2.colibri.tj/upload_blog/"
        let completeURL = url + (show?.blog?.blog_pics?[indexPath.row].blog_pic ?? "")
        cell.image.downloaded(from: completeURL)
        cell.image.image = UIImage(named: "image 1")
        cell.date.text = show?.blog?.blog_created_at ?? ""
        cell.subtitle.text = show?.blog?.blog_about ?? ""
        cell.subtitle.attributedText = show?.blog?.blog_about?.html2Attributed
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
