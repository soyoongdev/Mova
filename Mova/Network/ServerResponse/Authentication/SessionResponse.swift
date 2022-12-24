//
//  SessionResponse.swift
//  Mova
//
//  Created by HauNguyen on 21/12/2565 BE.
//

import Foundation

struct SessionResponse: Codable {
    var isSuccess: Bool
    var sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
        case sessionId = "session_id"
    }
}
