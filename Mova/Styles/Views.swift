//
//  Views.swift
//  Netflix Clone
//
//  Created by HauNguyen on 05/12/2565 BE.
//

import UIKit

extension UIView {
    
    class func blurView(frame: CGRect) -> UIView {
        let effectView = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        effectView.effect = blurEffect
        effectView.frame = frame
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return effectView
    }
    
}
