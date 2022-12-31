//
//  Extension+CAGradientLayer.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension CAGradientLayer {
    
    static func addGradient(with colors: [Any]?, frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame = frame
        return gradientLayer
    }
    
    
    func toColor() -> UIColor {
        UIGraphicsBeginImageContext(self.bounds.size)
        //create UIImage by rendering gradient layer.
        self.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //get gradient UIcolor from gradient UIImage
        return UIColor(patternImage: image!)
    }
}
