//
//  Movie.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import Foundation

struct Movie: Codable {
    
    var kind: String = ""
    var etag: String = ""
    var nextPageToken: String = ""
    var regionCode: String = ""
    var pageInfo: PageInfo = PageInfo()
    var items: [VideoElement] = [VideoElement]()
    
}
