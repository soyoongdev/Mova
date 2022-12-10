//
//  AdvanceTemplate.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

class AppTemplate: NSObject {
    
    private var _setDarkMode: Bool = false
    
    var isDarkMode: Bool {
        get {
            return _setDarkMode
        }
        set {
            self.isDarkMode = newValue
        }
    }
    
    func setChangeMode(mode: UIStatusBarStyle) {
        _setDarkMode = (mode == .darkContent) ? true : false
    }
    
    weak var primaryBackground: UIColor? {
        return UIColor(hex: "181A20")
    }
    
    weak var primaryRed: UIColor? {
        return UIColor(hex: "d91120")
    }
    
    weak var textColor: UIColor? {
        return self.isDarkMode ? .yellow : .brown
    }
    
    weak var textPlaceHolderLight: UIColor? {
        return UIColor(hex: "9c9c9f")
    }
    
    weak var white: UIColor? {
        return UIColor(hex: "fffff")
    }
    
}

// MARK: - Extension
extension AppTemplate {
    
    class var shared: AppTemplate {
        get {
            return AppTemplate()
        }
    }
    
}
