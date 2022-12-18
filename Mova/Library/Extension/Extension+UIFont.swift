//
//  Extension+UIFont.swift
//  Mova
//
//  Created by HauNguyen on 14/12/2565 BE.
//

import UIKit

extension UIFont {
    
    // Regular
    public static func regular(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoRegular.rawValue, size: size)
    }
    
    // Optional regular
    public static func regular(size: CGFloat? = 0) -> UIFont? {
        return UIFont(name: FontFamily.robotoRegular.rawValue, size: size!)
    }
}


extension UIFont {
    
    enum FontFamily : String {
        case robotoRegular = "Roboto-Regular"
        case robotoBold = "Roboto-Bold"
        case robotoBoldItalic = "Roboto-BoldItalic"
        case robotoMedium = "Roboto-Medium"
        case robotoMediumItalic = "Roboto-MediumItalic"
        case robotoItalic = "Roboto-Italic"
        case robotoLight = "Roboto-Light"
        case robotoLightItalic = "Roboto-LightItalic"
        case robotoBlack = "Roboto-Black"
        case robotoBlackItalic = "Roboto-BlackItalic"
        case robotoThin = "Roboto-Thin"
        case robotoThinItalic = "Roboto-ThinItalic"
    }
    
}
