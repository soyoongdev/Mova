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
        self.setBordered(color: .clear, for: .normal)
        self.setBordered(color: .primaryRed, width: 1, for: .highlighted)
        self.contentPaddingHorizontal = 10
        self.inputPaddingHorizontal = 5
        self.textColor = .textColor
        self.font = .semiBold(size: .small)
    }
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
        
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
    }

}
