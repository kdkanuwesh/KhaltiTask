//
//  RechangeAndPaymentsCVCell.swift
//  Khalti(Wish)
//
//  Created by Anuwesh khadka on 14/03/2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    private let titleLabel = UILabel()
    
    private let btnCashBack = UIButton()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        btnCashBack.setTitle("1-2% Cashback", for: .normal)
        
        btnCashBack.titleLabel?.font = KhaltiFonts.semibold.getFont(withSize: 9)
        
        btnCashBack.setTitleColor(.white, for: .normal)
        
        btnCashBack.backgroundColor = UIColor(named: "secondary")
        
        btnCashBack.layer.cornerRadius = 7
        
        btnCashBack.contentEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        
        imageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.035)
            
        ])

        titleLabel.textAlignment = .center
        
        titleLabel.font = KhaltiFonts.regular.getFont(withSize: 11)
        
        titleLabel.textColor = UIColor(named: "label")
        
        titleLabel.numberOfLines = 2
        
        titleLabel.tintColor = .gray
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
        ])
        
        autoLayoutForBtnCashback()
    }

    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }

    func configure(with khaltiModel: KhaltiModel) {
        
        imageView.image = khaltiModel.icon
        
        titleLabel.text = khaltiModel.title
        
        if khaltiModel.cashback {
            
            autoLayoutForBtnCashback()
            
        } else {
            
            btnCashBack.removeFromSuperview()
            
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            
        }
    }
    
    func autoLayoutForBtnCashback() {
        
        contentView.addSubview(btnCashBack)
        
        btnCashBack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            btnCashBack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            btnCashBack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            btnCashBack.heightAnchor.constraint(equalToConstant: 14),
            
            btnCashBack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
        
    }

}


