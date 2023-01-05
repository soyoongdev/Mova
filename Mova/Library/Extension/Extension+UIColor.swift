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
        
        if self.count > 1 {
            colors = self.map({$0.cgColor})
        } else {
            colors.append(contentsOf: self.map({$0.cgColor}))
            colors.append(contentsOf: self.map({$0.cgColor}))
//            colors.append(contentsOf: self.toCGColors)
        }
        
        return colors
    }
    
}

// Make extension for app template
extension UIColor {
    
    /// Unified background color for dark interface
    static var primaryBackground: UIColor {
        return UIColor(hex: "181A20")
    }
    
    /// Unified background color for dark interface
    static var primaryBackgroundLight: UIColor {
        return UIColor(hex: "1F212A")
    }
    
    /// Main color of the app
    static var primaryRed: UIColor {
        return UIColor(hex: "D91120")
    }
    
    /// Text color for buttons or titles using a light color (equivalent to default white)
    static var textColor: UIColor {
        return UIColor(hex: "FFFFFF")
    }
    
    /// Color used exclusively for buttons through states
    static var textButtonColor: ColorState? = {
        return ColorState(active: .white.withAlphaComponent(0.8), deactive: .white)
    }()
    
    /// Placeholder color for normal state
    static var placeholder: UIColor {
        return UIColor(hex: "9F9FA2")
    }
    
    /// Dark gray
    static var grayDark: UIColor {
        return UIColor(hex: "35383F")
    }
    
    static var grayOutline: UIColor {
        return UIColor(hex: "292C32")
    }
    
    /// Light gray
    static var grayLight: UIColor {
        return UIColor(hex: "B4B5B7")
    }
    
    static var primaryRedTextFieldSelected: UIColor {
        return UIColor(hex: "710911")
    }
    
}
