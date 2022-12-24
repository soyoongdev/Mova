//
//  StatusResponse.swift
//  Mova
//
//  Created by HauNguyen on 21/12/2565 BE.
//

import Foundation

struct StatusResponse: Codable {
    
    var isSuccess: Bool
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
    }
    
}
