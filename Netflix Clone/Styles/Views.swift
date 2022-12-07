//
//  Views.swift
//  Netflix Clone
//
//  Created by HauNguyen on 05/12/2565 BE.
//

import UIKit

extension UIView {
    
    func blurView() -> UIView {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    
}
