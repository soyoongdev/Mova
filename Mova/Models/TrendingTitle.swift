//
//  TrendingTitle.swift
//  Netflix Clone
//
//  Created by HauNguyen on 07/12/2565 BE.
//

import Foundation

struct TrendingTitle: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

