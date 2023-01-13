//
//  Extension+TextField.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit
 
extension UITextField {
    
    func toolbarAccessoryView(_ items: [UIBarButtonItem]) {
        // Create toolBar
        let toolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        toolBar.barTintColor = .primaryBackgroundLight
        toolBar.isTranslucent = false
        
        toolBar.setItems(items, animated: true)
        self.inputAccessoryView = toolBar
    }
    
}
