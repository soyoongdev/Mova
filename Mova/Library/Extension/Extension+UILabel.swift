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
    
    func drawLineOnBothSides(labelWidth: CGFloat, color: UIColor) {
        
        let fontAttributes = [NSAttributedString.Key.font: self.font]
        let size = self.text?.size(withAttributes: fontAttributes as [NSAttributedString.Key : Any])
        let widthOfString = size!.width
        
        let width = CGFloat(1)
        
        let leftLine = UIView(frame: CGRect(x: 0, y: self.frame.height/2 - width/2, width: labelWidth/2 - widthOfString/2 - 10, height: width))
        leftLine.backgroundColor = color
        self.addSubview(leftLine)
        
        let rightLine = UIView(frame: CGRect(x: labelWidth/2 + widthOfString/2 + 10, y: self.frame.height/2 - width/2, width: labelWidth/2 - widthOfString/2 - 10, height: width))
        rightLine.backgroundColor = color
        self.addSubview(rightLine)
    }
}

/// Padding label
extension UILabel {
    
    /// Rotation label
    func rotation(with size: CGFloat) {
        let radians = CGFloat(CGFloat(Double.pi) * size / CGFloat(180.0))
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
    
}
