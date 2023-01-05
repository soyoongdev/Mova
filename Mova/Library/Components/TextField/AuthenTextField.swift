//
//  AuthenTextField.swift
//  Mova
//
//  Created by HauNguyen on 04/01/2566 BE.
//

import UIKit

class AuthenTextField: MasterTextField {
    
    override func setupViews() {
        super.setupViews()
        self.setBackgroundColor(color: .primaryBackgroundLight, for: .normal)
        self.setBackgroundColor(color: .primaryRedTextFieldSelected, for: .highlighted)
        self.contentPaddingHorizontal = 10
        self.inputPaddingHorizontal = 5
        self.textColor = .textColor
        self.font = .semiBold(size: .small)
    }

}
