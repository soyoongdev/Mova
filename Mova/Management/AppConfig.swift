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
    
    func setDarkLightMode(style: UIUserInterfaceStyle) {
        guard let window = UIApplication.shared.windows.first else { return }
        
        UIView.animate(withDuration: 0.3) {
            window.overrideUserInterfaceStyle = style
        }
    }
    
}

// MARK: - Extension
extension AppConfig {
    
    class var shared: AppConfig {
        get {
            return AppConfig()
        }
    }
    
}
