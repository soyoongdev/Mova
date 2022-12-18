//
//  AdvanceTemplate.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

let appTemplate = AppTemplate.sharedInstance()

class AppTemplate: NSObject {
    
    weak var primaryBackground: UIColor? {
        return UIColor(hex: "181A20")
    }
    
    weak var primaryRed: UIColor? {
        return UIColor(hex: "d91120")
    }
    
    var textFieldColor: ColorState? = {
        return ColorState(active: .white.withAlphaComponent(0.8), deactive: .white)
    }()
    
    var textButtonColor: ColorState? = {
        return ColorState(active: .white.withAlphaComponent(0.8), deactive: .white)
    }()
    
    var textButtonColorSelected: UIColor? = {
        return .white.withAlphaComponent(0.8)
    }()
    
    weak var textPlaceHolderLight: UIColor? {
        return UIColor(hex: "9c9c9f")
    }
    
    weak var white: UIColor? {
        return UIColor(hex: "fffff")
    }
    
}

// MARK: - Extension
extension AppTemplate {
    
    private static var instance: AppConfig!
    
    public class func sharedInstance() -> AppConfig {
        if(self.instance == nil)
        {
            self.instance = AppConfig()
        }
        return self.instance
    }
    
}
