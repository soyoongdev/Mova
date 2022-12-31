//
//  AppConfig.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

/// This class is used for server-related application configuration management.
public class AppConfig: NSObject {
    
    static let shared: AppConfig = AppConfig()
    
    /// Host base url
    let hostUrl: String = "https://api.themoviedb.org/3/"
    
    /// API key
    var apiKey: String {
        get {
            return "bf4a7ffbc42719abb1793459cdd854e4"
        }
        set {
            _ = newValue
        }
    }
    
    // MARK: - Authentication
    
    /// Token value
    var userRequestToken: String {
        get {
            return UserDefaults.standard.string(forKey: "request_token") ?? ""
        }
    }
    
    /// Session id
    var userSessionId: String {
        get {
            return UserDefaults.standard.string(forKey: "session_id") ?? ""
        }
    }
    
    /// Guest Session id
    var userGuestSessionId: String {
        get {
            return UserDefaults.standard.string(forKey: "guest_session_id") ?? ""
        }
    }
    
    /// Username of User
    var userUsername: String {
        get {
            return UserDefaults.standard.string(forKey: "username") ?? ""
        }
    }
    
    /// Password of User
    var userPassword: String {
        get {
            return UserDefaults.standard.string(forKey: "password") ?? ""
        }
    }
    
}

// MARK: - Extension
extension AppConfig {
    
    
}
