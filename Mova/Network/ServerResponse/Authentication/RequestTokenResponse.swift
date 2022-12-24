//
//  RequestTokenResponse.swift
//  Mova
//
//  Created by HauNguyen on 21/12/2565 BE.
//

import Foundation

struct RequestTokenResponse: Codable {
    var isSuccess: Bool
    var requestToken: String
    var expiresAt: String
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
        case requestToken = "request_token"
        case expiresAt = "expires_at"
    }
}
