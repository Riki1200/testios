//
//  Movie.swift
//  testApp
//
//  Created by Romeo Betances on 5/9/22.
//

import Foundation
struct Movie: Decodable {
    var adult: Bool
    var backdrop_path: String
    var genre_ids: [Int]
    var id: Int
    var original_language, original_title, overview: String
    var popularity: Double
    var poster_path, release_date, title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int

    init() {
        adult = false
        backdrop_path = ""
        genre_ids = []
        id = 0
        original_language = ""
        original_title = ""
        overview = ""
        popularity = 0.0
        poster_path = ""
        release_date = ""
        title = ""
        video = false
        vote_average = 0.0
        vote_count = 0
    }
}
