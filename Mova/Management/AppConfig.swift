//
//  AppConfig.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

/**
 The goal is to create this class to use for managing app configurations such as:
 device rotation,
 light and dark modes,
 configuration permissions to access user location,
 screenshots, v.v..
 */
public class AppConfig: NSObject {
    
    static let shared: AppConfig = AppConfig()
    
    var isDarkMode: Bool {
        get {
            return _isDarkMode
        }
    }
    
    private var _isDarkMode: Bool = false
    
    func setDarkLightMode(style: UIUserInterfaceStyle) {
        if style == .dark {
            self._isDarkMode = true
        } else {
            self._isDarkMode = false
        }
    }
    
    
    func checkConnectionActivity() {
        
    }
    
    var isNetworkConnected: Bool = false
    
}

// MARK: - Extension
extension AppConfig {
    
    
}
