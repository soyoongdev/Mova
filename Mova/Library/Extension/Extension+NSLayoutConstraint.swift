//
//  Extension+NSLayoutConstraint.swift
//  Mova
//
//  Created by HauNguyen on 03/01/2566 BE.
//

import UIKit

extension NSLayoutConstraint {
    
    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
    
}
