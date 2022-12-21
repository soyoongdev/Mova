//
//  BaseResponse.swift
//  Mova
//
//  Created by HauNguyen on 20/12/2565 BE.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var page: Int = 0
    var data = [] as [T]
    var totalPages: Int = 0
    var totalResults: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case data = "results"
    }
}
