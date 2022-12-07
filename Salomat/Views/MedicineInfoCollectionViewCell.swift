//
//  MedicineInfoCollectionViewCell.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 22/11/22.
//

import UIKit

class MedicineInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "MedicineInfoCollectionViewCell"
   // var cell = SearchCollectionView()
    var reviewCell = ReviewCollectionView()
    var id: String = ""
    
    lazy var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0.235, green: 0.902, blue: 0.51, alpha: 1)
        uiView.layer.cornerRadius = 4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    
    lazy var instructionScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = contentView.bounds
        scroll.contentSize = CGSize(width: contentView.frame.size.width, height: 1200)
        scroll.backgroundColor = .white
        return scroll
    }()
    
    lazy var analogScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = contentView.bounds
       // scroll.contentSize = CGSize(width: contentView.frame.size.width, height: 1200)
        scroll.backgroundColor = .white
        return scroll
    }()
    
   
    
    lazy var feedbackScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = contentView.bounds
        scroll.contentSize = CGSize(width: contentView.frame.size.width, height: 1200)
        scroll.backgroundColor = .white
        return scroll
    }()
    
    lazy var instruction: UIButton = {
        let button = UIButton()
        button.setTitle("Instruction", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(configureInstruction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var analog: UIButton = {
        let button = UIButton()
        button.setTitle("Analog", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(configureAnalog), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var feedback: UIButton = {
        let button = UIButton()
        button.setTitle("FeedBack", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(configurefeedback), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Еще", for: .normal)
        button.setTitleColor(UIColor(red: 0.118, green: 0.745, blue: 0.745, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var productDescription: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1)
        label.text = "Антацидный препарат, представляющий собой сбалансированную комбинацию алгелдрата (алюминия гидроксида) и магния гидроксида..."
        label.numberOfLines = 0
        label.setNeedsDisplay()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var leaveFeedback: UILabel = {
        let label = UILabel()
        label.text = "Оставьте свой отзыв"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rating: UILabel = {
        let label = UILabel()
        label.text = "Ваша оценка"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ваш отзыв"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ваше имя"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let contentRect: CGRect = self.analogScroll.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(contentView.frame)
        }
        configureInstruction()
        analogScroll.contentSize = contentRect.size
    }
    
    @objc func configureInstruction() {
        contentView.addSubview(instructionScroll)
        instructionScroll.addSubview(instruction)
        instructionScroll.addSubview(analog)
        instructionScroll.addSubview(feedback)
        instructionScroll.addSubview(uiView)
        instructionScroll.addSubview(productDescription)
        //instructionScroll.addSubview(moreButton)
        moreButton.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
        instruction.setTitleColor(UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1), for: .normal)
        analog.setTitleColor(UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1), for: .normal)
        feedback.setTitleColor(UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1), for: .normal)
        
        NSLayoutConstraint.activate([
            instruction.topAnchor.constraint(equalTo: instructionScroll.topAnchor, constant: 20),
            instruction.leadingAnchor.constraint(equalTo: instructionScroll.leadingAnchor, constant: 16),
            instruction.heightAnchor.constraint(equalToConstant: 40),
            instruction.widthAnchor.constraint(equalToConstant: 100),
            
            analog.topAnchor.constraint(equalTo: instructionScroll.topAnchor, constant: 20),
            analog.leadingAnchor.constraint(equalTo: instruction.trailingAnchor, constant: 5),
            analog.heightAnchor.constraint(equalToConstant: 40),
            analog.widthAnchor.constraint(equalToConstant: 100),
        
            feedback.topAnchor.constraint(equalTo: instructionScroll.topAnchor, constant: 20),
            feedback.leadingAnchor.constraint(equalTo: analog.trailingAnchor, constant: 5),
            feedback.heightAnchor.constraint(equalToConstant: 40),
            feedback.widthAnchor.constraint(equalToConstant: 100),
            
            uiView.topAnchor.constraint(equalTo: instruction.bottomAnchor, constant: 5),
            uiView.leadingAnchor.constraint(equalTo: instruction.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: instruction.trailingAnchor),
            uiView.heightAnchor.constraint(equalToConstant: 3),
            
            productDescription.topAnchor.constraint(equalTo: instruction.bottomAnchor, constant: 20),
            productDescription.leadingAnchor.constraint(equalTo: instructionScroll.leadingAnchor, constant: 16),
            productDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            productDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
//            moreButton.topAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: 10),
//            moreButton.leadingAnchor.constraint(equalTo: instructionScroll.leadingAnchor, constant: 10),
//            moreButton.heightAnchor.constraint(equalToConstant: 25),
//            moreButton.widthAnchor.constraint(equalToConstant: 55),
//            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func configureAnalog() {
        contentView.addSubview(analogScroll)
        analogScroll.addSubview(instruction)
        analogScroll.addSubview(analog)
        analogScroll.addSubview(feedback)
        analogScroll.addSubview(uiView)
       // analogScroll.addSubview(cell)
        analog.setTitleColor(UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1), for: .normal)
        instruction.setTitleColor(UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1), for: .normal)
        feedback.setTitleColor(UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1), for: .normal)
        
        NSLayoutConstraint.activate([
            instruction.topAnchor.constraint(equalTo: analogScroll.topAnchor, constant: 20),
            instruction.leadingAnchor.constraint(equalTo: analogScroll.leadingAnchor, constant: 16),
            instruction.heightAnchor.constraint(equalToConstant: 40),
            instruction.widthAnchor.constraint(equalToConstant: 100),
        
            analog.topAnchor.constraint(equalTo: analogScroll.topAnchor, constant: 20),
            analog.leadingAnchor.constraint(equalTo: instruction.trailingAnchor, constant: 5),
            analog.heightAnchor.constraint(equalToConstant: 40),
            analog.widthAnchor.constraint(equalToConstant: 100),
        
            feedback.topAnchor.constraint(equalTo: analogScroll.topAnchor, constant: 20),
            feedback.leadingAnchor.constraint(equalTo: analog.trailingAnchor, constant: 5),
            feedback.heightAnchor.constraint(equalToConstant: 40),
            feedback.widthAnchor.constraint(equalToConstant: 100),
            
            uiView.topAnchor.constraint(equalTo: analog.bottomAnchor, constant: 5),
            uiView.leadingAnchor.constraint(equalTo: analog.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: analog.trailingAnchor),
            uiView.heightAnchor.constraint(equalToConstant: 3),
            
//            cell.topAnchor.constraint(equalTo: instruction.bottomAnchor, constant: 30),
//            cell.leadingAnchor.constraint(equalTo: analogScroll.leadingAnchor),
//            cell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            cell.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func configurefeedback() {
        contentView.addSubview(feedbackScroll)
        feedbackScroll.addSubview(instruction)
        feedbackScroll.addSubview(analog)
        feedbackScroll.addSubview(feedback)
        feedbackScroll.addSubview(uiView)
        feedbackScroll.addSubview(reviewCell)
        reviewCell.id = id
        print("ididid \(id)")
        feedback.setTitleColor(UIColor(red: 0.22, green: 0.208, blue: 0.325, alpha: 1), for: .normal)
        analog.setTitleColor(UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1), for: .normal)
        instruction.setTitleColor(UIColor(red: 0.478, green: 0.463, blue: 0.617, alpha: 1), for: .normal)
        
        NSLayoutConstraint.activate([
            instruction.topAnchor.constraint(equalTo: feedbackScroll.topAnchor, constant: 20),
            instruction.leadingAnchor.constraint(equalTo: instructionScroll.leadingAnchor, constant: 16),
            instruction.heightAnchor.constraint(equalToConstant: 40),
            instruction.widthAnchor.constraint(equalToConstant: 100),
        
            analog.topAnchor.constraint(equalTo: feedbackScroll.topAnchor, constant: 20),
            analog.leadingAnchor.constraint(equalTo: instruction.trailingAnchor, constant: 5),
            analog.heightAnchor.constraint(equalToConstant: 40),
            analog.widthAnchor.constraint(equalToConstant: 100),
        
            feedback.topAnchor.constraint(equalTo: feedbackScroll.topAnchor, constant: 20),
            feedback.leadingAnchor.constraint(equalTo: analog.trailingAnchor, constant: 5),
            feedback.heightAnchor.constraint(equalToConstant: 40),
            feedback.widthAnchor.constraint(equalToConstant: 100),
            
            uiView.topAnchor.constraint(equalTo: feedback.bottomAnchor, constant: 5),
            uiView.leadingAnchor.constraint(equalTo: feedback.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: feedback.trailingAnchor),
            uiView.heightAnchor.constraint(equalToConstant: 3),
            
            reviewCell.topAnchor.constraint(equalTo: uiView.bottomAnchor, constant: 20),
            reviewCell.leadingAnchor.constraint(equalTo: feedbackScroll.leadingAnchor),
            reviewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            reviewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        
        ])
    }
    
    @objc func instructionAction() {
        configureInstruction()
    }
    
    @objc func analogAction() {
        configureAnalog()
    }
    
    @objc func feedbackAction() {
        configurefeedback()
    }
    
    @objc func moreButtonAction() {
        if productDescription.numberOfLines == 3 {
            productDescription.numberOfLines = 0
            moreButton.setTitle("Меньше", for: .normal)
        }
        else {
            productDescription.numberOfLines = 3
            moreButton.setTitle("Еще", for: .normal)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
