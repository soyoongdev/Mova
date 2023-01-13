//
//  Extension+UIGestureRecognizer.swift
//  Mova
//
//  Created by HauNguyen on 11/01/2566 BE.
//

import UIKit

extension UIGestureRecognizer {
    
    static func tapGesture(target: Any?, action: Selector?) -> UITapGestureRecognizer {
        let elsewhereTap = UITapGestureRecognizer(target: target, action: action)
        return elsewhereTap
    }
    
}
