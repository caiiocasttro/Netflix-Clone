//
//  Movie.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 10.07.23.
//

import Foundation


struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let vote_average: Double
    let vote_count: Int
}

/*
 id = 955555;
 "media_type" = movie;
 "original_language" = ko;
 "original_title" = "\Ubc94\Uc8c4\Ub3c4\Uc2dc 3";
 overview = "Detective Ma Seok-do changes his affiliation from the Geumcheon Police Station to the Metropolitan Investigation Team, in order to eradicate Japanese gangsters who enter Korea to commit heinous crimes.";
 popularity = "168.153";
 "poster_path" = "/w5ZzelrldWr7CmOTSiwagoe5Vl9.jpg";
 "release_date" = "2023-05-31";
 title = "The Roundup: No Way Out";
 video = 0;
 "vote_average" = "6.146";
 "vote_count" = 65;
}
 */
