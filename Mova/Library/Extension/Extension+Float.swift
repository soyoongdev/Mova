//
//  Extension+Float.swift
//  Mova
//
//  Created by HauNguyen on 05/01/2566 BE.
//

import Foundation
import UIKit

extension Float {
    
    func relativeToIphone8Width() -> Float {
        return Float(self * (Float(UIScreen.main.bounds.width) / 375))
    }
    
    func relativeToIphone8Height() -> Float {
        var extraHeight: CGFloat = 0
        // Get safeAre size
        if #available(iOS 11.0, *) {
            extraHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
            extraHeight = extraHeight + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
        }
        
        return Float(self * (Float((UIScreen.main.bounds.height - extraHeight)) / 667))
    }
    
}
