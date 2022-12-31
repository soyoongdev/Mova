//
//  Extension+UILabel.swift
//  Mova
//
//  Created by HauNguyen on 31/12/2565 BE.
//

import UIKit

extension UILabel {
    
    func getFrame() -> CGRect {
        let label = UILabel()
        label.text = self.text
        label.font = self.font
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.frame.size.width = CGFloat(MAXFLOAT)
        label.frame.size.height = CGFloat(MAXFLOAT)
        label.sizeToFit()
        return label.frame
    }
    
}
