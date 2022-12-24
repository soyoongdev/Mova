//
//  GuestSessionResponse.swift
//  Mova
//
//  Created by HauNguyen on 21/12/2565 BE.
//

import Foundation

struct GuestSessionResponse: Codable {
    var isSuccess: Bool
    var guestSessionId: String
    var expiresAt: String
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
        case guestSessionId = "guest_session_id"
        case expiresAt = "expires_at"
    }
}
