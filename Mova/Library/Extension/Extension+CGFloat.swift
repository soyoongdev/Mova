//
//  Extension+CGFloat.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit
import Foundation

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
}

extension CGFloat {
    
    var relativeSize: CGFloat {
        // target size (iPhone 8)
        let targetWidth = CGFloat(375.0)
        let targetHeight = CGFloat(667.0)
        let squareTarget = CGFloat(targetWidth * targetWidth) + CGFloat(targetHeight * targetHeight)
        let targetSize = CGFloat(sqrt(squareTarget))
        // Current size
        let currentWidth = UIScreen.main.bounds.width
        let currentHeight = UIScreen.main.bounds.height
        let squareCurrent = CGFloat(currentWidth * currentWidth) + CGFloat(currentHeight * currentHeight)
        let currentSize = CGFloat(sqrt(squareCurrent))
                
        let dimenSize: CGFloat = currentSize / targetSize
        
        return CGFloat(self * dimenSize)
    }
    
    func relativeToIphone8Width() -> CGFloat {
        return CGFloat(self * (UIScreen.main.bounds.width / 375))
    }
    
    func relativeToIphone8Height() -> CGFloat {
        var extraHeight: CGFloat = 0
        // Get safeAre size
        if #available(iOS 11.0, *) {
            extraHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
            extraHeight = extraHeight + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
        }
        
        return CGFloat(self * ((UIScreen.main.bounds.height - extraHeight) / 667))
    }
    
}

extension CGFloat {
    
    static var appResource: AppStyle {
        return AppStyle.shared
    }
    
}
