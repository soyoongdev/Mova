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
    static var large18: CGFloat {
        return 18.0
    }
    
    /// This size is 20.0
    static var large20: CGFloat {
        return 20.0
    }
    
    /// This size is 22.0
    static var large22: CGFloat {
        return 22.0
    }
    
    /// This size is 24.0
    static var large24: CGFloat {
        return 24.0
    }
    
    /// This size is 26.0
    static var large26: CGFloat {
        return 26.0
    }
    
    /// This size is 28.0
    static var large28: CGFloat {
        return 28.0
    }
    
    /// This size is 30.0
    static var large30: CGFloat {
        return 30.0
    }
    
    /// This size is 32.0
    static var extra32: CGFloat {
        return 32.0
    }
    
    /// This size is 34.0
    static var extra34: CGFloat {
        return 34.0
    }
    
    /// This size is 36.0
    static var extra36: CGFloat {
        return 36.0
    }
    
    /// This size is 38.0
    static var extra38: CGFloat {
        return 38.0
    }
    
    /// This size is 34.0
    static var extra40: CGFloat {
        return 40.0
    }
    
    /// This size is 42.0
    static var extra42: CGFloat {
        return 42.0
    }
}
