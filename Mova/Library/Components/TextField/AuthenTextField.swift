//
//  AuthenTextField.swift
//  Mova
//
//  Created by HauNguyen on 04/01/2566 BE.
//

import UIKit

class AuthenTextField: MasterTextField, UITextFieldDelegate {
    
    override func setupViews() {
        super.setupViews()
        self.delegate = self
        self.setBackgroundColor(color: .primaryBackgroundLight, for: .normal)
        self.setBackgroundColor(color: .primaryRed, for: .selected)
        self.contentPaddingHorizontal = 20
        self.inputPaddingHorizontal = 10
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

}
