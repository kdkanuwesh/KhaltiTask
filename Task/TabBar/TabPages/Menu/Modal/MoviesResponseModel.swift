//
//  MoviesResponseModel.swift
//  Task
//
//  Created by Anuwesh Khadka on 16/03/2023.
//

import Foundation

struct Movie: Codable {
    
    let title: String
    
    let year: String
    
    let imdbID: String
    
    let type: String
    
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        
        case year = "Year"
        
        case imdbID
        
        case type = "Type"
        
        case poster = "Poster"
    }
}

struct SearchResults: Codable {
    
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        
        case movies = "Search"
    }
}
