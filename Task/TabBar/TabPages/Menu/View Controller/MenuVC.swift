//
//  MenuVC.swift
//  Task
//
//  Created by Anuwesh Khadka on 08/03/2023.
//

import Foundation

import UIKit

class MenuVC: UIViewController {
        
    var collectionView: UICollectionView!

    let cellReuseIdentifier = "MovieCell"
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .white

        // Set up API request
        let apiKey = "http://www.omdbapi.com/?i=tt3896198&apikey=4ced663e"
        
        let urlString = "http://www.omdbapi.com/?apikey=[\(apiKey)]&"
        
//    http://www.omdbapi.com/?apikey=\(apiKey)&s=&type=movie&r=json
        
        guard let url = URL(string: urlString) else {
            
            print("Invalid URL")
            
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"

        // Perform API request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                
                print("API request error: \(error.localizedDescription)")
                
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                
                print("API request failed")
                
                return
            }
            guard let data = data else {
                
                print("No data returned from API")
                
                return
            }

            // Parse API response
            do {
                
                let searchResults = try JSONDecoder().decode(SearchResults.self, from: data)
                
                self.movies = searchResults.movies
                
                DispatchQueue.main.async {
                    
                    self.collectionView.reloadData()
                }
                
            } catch {
                
                print("Error parsing API response: \(error.localizedDescription)")
            }
        }
        
        task.resume()

        // Set up collection view
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        layout.itemSize = CGSize(width: view.frame.width - 40, height: 120)
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        self.collectionView = collectionView
    }
}

extension MenuVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? MovieCollectionViewCell else {
            
            fatalError("Unable to dequeue cell")
        }
        
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        
        cell.yearLabel.text = movie.year
        
        if let posterURL = movie.poster {
            
            URLSession.shared.dataTask(with: URL(string: posterURL)!) { data, response, error in
                
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async() {
                    
                    cell.posterImageView.image = UIImage(data: data)
                }
                
            }.resume()
            
        } else {
            
            cell.posterImageView.image = UIImage(named: "placeholder")
        }

        return cell
    }
}



