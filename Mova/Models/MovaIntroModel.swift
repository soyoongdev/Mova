//
//  MovaIntroModel.swift
//  Mova
//
//  Created by HauNguyen on 28/12/2565 BE.
//

import UIKit

struct MovaIntroModel: Codable {
    var id: Int64
    var imageUrl: String
    var title: String
    var subTitle: String
    
    init(id: Int64, imageUrl: String, title: String, subTitle: String) {
        self.id = id
        self.imageUrl = imageUrl
        self.title = title
        self.subTitle = subTitle
    }
}
