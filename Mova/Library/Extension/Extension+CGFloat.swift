//
//  Extension+CGFloat.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
}

extension CGFloat {
    
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
    
    /// This size is 10.0
    static var smallest: CGFloat {
        return 10.0
    }
    
    /// This size is 14.0
    static var small: CGFloat {
        return 14.0
    }
    
    /// This size is 16.0
    static var medium: CGFloat {
        return 16.0
    }
    
    /// This size is 18.0
    static var large: CGFloat {
        return 18.0
    }
    
    /// This size is 20.0
    static var larger: CGFloat {
        return 20.0
    }
    
    /// This size is 22.0
    static var superLarger: CGFloat {
        return 22.0
    }
    
    /// This size is 24.0
    static var extraLarger: CGFloat {
        return 24.0
    }
}
