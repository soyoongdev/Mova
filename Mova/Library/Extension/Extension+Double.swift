//
//  Extension+Double.swift
//  Mova
//
//  Created by HauNguyen on 05/01/2566 BE.
//

import Foundation
import UIKit

extension Double {
    
    func relativeToIphone8Width() -> Double {
        return Double(self * (Double(UIScreen.main.bounds.width) / 375))
    }
    
    func relativeToIphone8Height() -> Double {
        var extraHeight: CGFloat = 0
        // Get safeAre size
        if #available(iOS 11.0, *) {
            extraHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
            extraHeight = extraHeight + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
        }
        
        return Double(self * (Double((UIScreen.main.bounds.height - extraHeight)) / 667))
    }
    
}
