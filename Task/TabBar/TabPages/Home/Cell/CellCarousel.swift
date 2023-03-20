//
//  CellCarousel.swift
//  Task
//
//  Created by Anuwesh Khadka on 14/03/2023.
//

import UIKit

class CellCarousel: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.backgroundColor = .white
        
        imageView.layer.cornerRadius = 8
        
        imageView.clipsToBounds = true
        
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }

    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }

}


