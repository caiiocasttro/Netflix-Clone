//
//  Movie.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 10.07.23.
//

import Foundation


struct TrendingTitlesResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let vote_average: Double
    let vote_count: Int
}


