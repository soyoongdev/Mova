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
        self.setBackgroundColor(color: .appResource.primaryBackground, for: .normal)
        self.setBackgroundColor(color: .appResource.primaryRedThinBlack, for: .highlighted)
        self.setBordered(color: .clear, for: .normal)
        self.setBordered(color: .appResource.primaryRed, width: 1, for: .highlighted)
        self.contentPaddingHorizontal = 16
        self.inputPaddingHorizontal = 14
        self.textColor = .appResource.textColor
        self.font = .semiBold(size: .appResource.primaryTextSizePopular)
    }
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
        
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
    }

}
