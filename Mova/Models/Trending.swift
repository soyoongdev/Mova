//
//  Trending.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import Foundation

struct Trending: Codable {
    var id: Int64 = 0
    var adult: Bool = false
    var backdrop_path: String = ""
    var title: String = ""
    var original_language: String = ""
    var original_title: String = ""
    var overview: String = ""
    var poster_path: String = ""
    var media_type: String = ""
    var genre_ids: [Int64] = [Int64]()
    var popularity: Double = 0
    var release_date: String = ""
    var video: Bool = false
    var vote_average: Double = 0
    var vote_count: Int = 0
}
