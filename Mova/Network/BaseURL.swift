//
//  BaseURL.swift
//  Mova
//
//  Created by HauNguyen on 20/12/2565 BE.
//

import UIKit

class BaseURL: NSObject {
    
    static let shared = BaseURL()
    
    let baseUrl: String = "https://api.themoviedb.org/3/"
    
    let apiKey: String = "697d439ac993538da4e3e60b54e762cd"
    
    var requestToken: String = "697d439ac993538da4e3e60b54e762cd"
    
    var guestSessionId: String = "697d439ac993538da4e3e60b54e762cd"
    
}
