//
//  FontStyle.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit


extension UIFont {
    
    /// Regular
    public static func regular(size: CGFloat) -> UIFont? {
        return UIFont(name: FontType.robotoRegular.rawValue, size: size)
    }
    
}


extension UIFont {
    
    static var fontType: FontType!
    
    enum FontType : String {
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
