//
//  Extension+CGSize.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit

extension CGSize {
    
    public init(relative width: CGFloat, relative height: CGFloat) {
        self.init(width: width.relativeToIphone8Width(), height: height.relativeToIphone8Height())
    }
    
}
