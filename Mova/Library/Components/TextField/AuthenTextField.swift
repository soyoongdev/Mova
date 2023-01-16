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
        let radius: CGFloat = .appResource.primaryTextFieldSizePopular.height/4
        self.setBackgroundColor(color: .appResource.primaryGreyDark, cornerRadius: radius, for: .normal)
        self.setBackgroundColor(color: .appResource.primaryRedThinBlack, cornerRadius: radius, for: .highlighted)
        self.setBordered(color: .clear, cornerRadius: radius, for: .normal)
        self.setBordered(color: .appResource.primaryRed, width: 1, cornerRadius: radius, for: .highlighted)
        self.contentPaddingHorizontal = 16
        self.inputPaddingHorizontal = 8
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

import SwiftUI

struct AuthenTextField_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: LoginAccountViewController())
    }
}
