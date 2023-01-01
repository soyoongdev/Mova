//
//  Extension+UIFont.swift
//  Mova
//
//  Created by HauNguyen on 14/12/2565 BE.
//

import UIKit

extension UIFont {
    
    
    /// Thin 100
    public static func thin(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoThin.rawValue, size: size)
    }
    
    /// Thin 100 Italic
    public static func thinItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoThinItalic.rawValue, size: size)
    }
    
    /// ExtraLight 200
    public static func extraLight(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoExtraLight.rawValue, size: size)
    }
    
    /// ExtraLight 200 Italic
    public static func extraLightItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoExtraLightItalic.rawValue, size: size)
    }
    
    /// Light 300
    public static func light(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoLight.rawValue, size: size)
    }
    
    /// Light 300 Italic
    public static func lightItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoLightItalic.rawValue, size: size)
    }
    
    /// Regular 400
    public static func regular(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoRegular.rawValue, size: size)
    }
    
    /// Regular 400 Italic
    public static func regularItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoItalic.rawValue, size: size)
    }
    
    /// Medium 500
    public static func medium(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoMedium.rawValue, size: size)
    }
    
    /// Medium 500 Italic
    public static func mediumItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoMediumItalic.rawValue, size: size)
    }
    
    /// SemiBold 600
    public static func semiBold(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoSemiBold.rawValue, size: size)
    }
    
    /// SemiBold 600 Italic
    public static func semiBoldItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoSemiBoldItalic.rawValue, size: size)
    }
    
    /// Bold 700
    public static func bold(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBold.rawValue, size: size)
    }
    
    /// Bold 700 Italic
    public static func boldItalic(size: CGFloat) -> UIFont? {
        return UIFont(name: FontFamily.robotoBoldItalic.rawValue, size: size)
    }
    
}


extension UIFont {
    
    enum FontFamily : String {
        case robotoThin = "RobotoMono-Thin"
        case robotoThinItalic = "RobotoMono-ThinIralic"
        case robotoSemiBold = "RobotoMono-SemiBold"
        case robotoSemiBoldItalic = "RobotoMono-SemiBoldItalic"
        case robotoRegular = "RobotoMono-Regular"
        case robotoRegularItalic = "RobotoMono-RegularItalic"
        case robotoMedium = "RobotoMono-Medium"
        case robotoMediumItalic = "RobotoMono-MediumItalic"
        case robotoLight = "RobotoMono-Light"
        case robotoLightItalic = "RobotoMono-LightItalic"
        case robotoItalic = "RobotoMono-Italic"
        case robotoExtraLight = "RobotoMono-ExtraLight"
        case robotoExtraLightItalic = "RobotoMono-ExtraLightItalic"
        case robotoBold = "RobotoMono-Bold"
        case robotoBoldItalic = "RobotoMono-BoldItalic"
    }
    
}
