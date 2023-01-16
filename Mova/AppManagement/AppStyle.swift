//
//  AppStyle.swift
//  Mova
//
//  Created by HauNguyen on 14/01/2566 BE.
//

import UIKit
import Foundation

class AppStyle {
    
    // Self
    static let shared: AppStyle = AppStyle()
    
    static let appManager = AppManager()
}


// Make extension for app template
extension AppStyle {
    
    /// Unified background color for dark interface
    var primaryBackgroundDark: UIColor {
        return UIColor(hex: "181A20")
    }
    
    /// Unified background color for dark interface
    var primaryBackgroundLight: UIColor {
        return UIColor(hex: "FFFFFF")
    }
    
    /// Unified background color change with theme mode
    var primaryBackground: UIColor {
        return primaryBackgroundDark
    }
    
    /// Main color
    var primaryRed: UIColor {
        return UIColor(hex: "E21221")
    }
    
    /// Main color
    var primaryRedThinBlack: UIColor {
        return UIColor(hex: "27191F")
    }
    
    /// Text color
    var textColor: UIColor {
        return UIColor(hex: "FFFFFF")
    }
    
    /// Textfield placeholder
    var placeholderColor: UIColor {
        return UIColor(hex: "9F9FA2")
    }
    
    /// Background textfield
    var primaryGreyDark: UIColor {
        return UIColor(hex: "1F212A")
    }
    
    /// Background button
    var primaryGreyLight: UIColor {
        return UIColor(hex: "7B8180")
    }
    
    /// Icon textfield or placeholder
    var primaryGrey: UIColor {
        return UIColor(hex: "35383F")
    }
    
}

// Primary size
extension AppStyle {
    
    /// Primary text size 14
    var primaryTextSizeSmall: CGFloat {
        return 14
    }
    
    /// Primary text size 16 and popular text size
    var primaryTextSizePopular: CGFloat {
        return 14
    }
    
    /// Primary text size 16
    var primaryTextSizeLarge16: CGFloat {
        return 16
    }
    
    /// Primary text size 18
    var primaryTextSizeLarge18: CGFloat {
        return 18
    }
    
    /// Primary text size 20
    var primaryTextSizeLarge20: CGFloat {
        return 20
    }
    
    /// Primary text size 22
    var primaryTextSizeLarge22: CGFloat {
        return 22
    }
    
    /// Primary text size 24
    var primaryTextSizeLarge24: CGFloat {
        return 24
    }
    
    /// Primary text size 26
    var primaryTextSizeLarge26: CGFloat {
        return 26
    }
    
    /// Primary text size 28, padding horizontal button ground icon
    var primaryTextSizeLarge28: CGFloat {
        return 28
    }
    
    /// Primary text size 30
    var primaryTextSizeLarge30: CGFloat {
        return 30
    }
    
    /// Primary text size 32
    var primaryTextSizeLarge32: CGFloat {
        return 32
    }
    
    /// Primary text size 34
    var primaryTextSizeLarge34: CGFloat {
        return 34
    }
    
    /// Primary text size 36
    var primaryTextSizeLarge36: CGFloat {
        return 36
    }
    
    /// Primary text size 38
    var primaryTextSizeLarge38: CGFloat {
        return 38
    }
}

// Icon size
extension AppStyle {
    
    /// Primary bottom navigation icon size: 24
    var bottomNavIconSize: CGFloat {
        return 24
    }
    
    /// Primary small icon size with size: 16
    var primaryIconSmall: CGFloat {
        return 16
    }
    
    /// Primary small icon size with size: 20
    var primaryIconMedium: CGFloat {
        return 20
    }
    
    /// Primary small icon size with size: 24
    var primaryIconPopular: CGFloat {
        return 24
    }
}

// Button size
extension AppStyle {
    
    /// Primary button ground icon with width: 84.0 and height: 52.0
    var primaryButtonGroundSize: CGSize {
        return CGSize(width: 84.0, height: 52.0)
    }
    
    /// Primary button small size with width: 84.0 and height: 42.0
    var primaryButtonSmall: CGSize {
        return CGSize(width: (42.0 * 2), height: 42.0)
    }
    
    /// Primary button medium size with width: 104.0 and height: 52.0
    var primaryButtonPopular: CGSize {
        return CGSize(width: (52.0 * 2), height: 52.0)
    }
    
    /// Primary button large size with width: 122.0 and height: 62.0
    var primaryButtonLarge: CGSize {
        return CGSize(width: (62.0 * 2), height: 62.0)
    }
    
}

extension AppStyle {
    
    var primaryTextFieldSizePopular: CGSize {
        return CGSize(width: 52.0 * 2, height: 52.0)
    }
    
}
