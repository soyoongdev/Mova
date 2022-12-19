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
    
    // medium
    public static func medium(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoMedium.rawValue, size: size)
    }
    
    public static func mediumItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoMediumItalic.rawValue, size: size)
    }
    
    // Italic
    public static func italic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoItalic.rawValue, size: size)
    }
    
    // Light
    public static func light(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoLight.rawValue, size: size)
    }
    
    // Light Italic
    public static func lightItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoLightItalic.rawValue, size: size)
    }
    
    // Black
    public static func black(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBlack.rawValue, size: size)
    }
    
    // Black Italic
    public static func blackItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBlackItalic.rawValue, size: size)
    }
    
    // Thin
    public static func thin(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoThin.rawValue, size: size)
    }
    
    // Thin Italic
    public static func thinItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoThinItalic.rawValue, size: size)
    }
    
    // Bold
    public static func bold(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBold.rawValue, size: size)
    }
    
    // Bold Italic
    public static func boldItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBoldItalic.rawValue, size: size)
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
