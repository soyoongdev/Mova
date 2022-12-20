//
//  VideoElement.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import Foundation

struct VideoElement: Codable {
    var id: IdVideo = IdVideo()
    var nextPageToken: String = ""
    var etag: String = ""
}
