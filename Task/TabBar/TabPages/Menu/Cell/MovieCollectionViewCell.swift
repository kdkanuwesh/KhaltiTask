//
//  MovieCollectionViewCell.swift
//  Task
//
//  Created by Anuwesh Khadka on 16/03/2023.
//

import Foundation
import UIKit



class MovieCollectionViewCell: UICollectionViewCell {
    
   
    
    let yearLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 18)

        return label
        
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .center
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        label.numberOfLines = 0
        
        return label
        
    }()
    
    let posterImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.cornerRadius = 10
        
        imageView.clipsToBounds = true
        
        return imageView
        
    }()
    
    // Define the cell's layout
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(posterImageView)
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            posterImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)
            
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure the cell with a movie object
    func configure(with movie: Movie) {
        
        titleLabel.text = movie.title
        
        if let posterURL = movie.poster, let url = URL(string: posterURL) {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    
                    print("Error downloading image: \(error)")
                    
                    return
                }
                
                guard let data = data, let image = UIImage(data: data) else {
                    
                    print("Invalid image data")
                    
                    return
                }
                
                DispatchQueue.main.async {
                    
                    self.posterImageView.image = image
                    
                }
                
            }.resume()
            
        } else {
            
            posterImageView.image = UIImage(named: "placeholder")
        }
    }

}

    

