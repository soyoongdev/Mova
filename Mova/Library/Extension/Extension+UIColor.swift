//
//  Extension+UIColor.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            if (cString.hasPrefix("#")) {
                cString.remove(at: cString.startIndex)
            }
            if ((cString.count) != 6) {
                self.init()
            }
            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
        self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
    }
    
    static func random() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }

    
}

extension [UIColor] {
    
    var toCGColors: [CGColor] {
        var colors = [CGColor]()
        for color in self {
            colors.append(color.cgColor)
        }
        return colors
    }
    
}

// Make extension for app template
extension UIColor {
    private static var template: AppTemplate {
        return AppTemplate()
    }
    
    static var textButtonColor: ColorState? {
        return template.textButtonColor
    }
    
}