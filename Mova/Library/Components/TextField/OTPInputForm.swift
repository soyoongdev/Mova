//
//  OTPInputForm.swift
//  Mova
//
//  Created by HauNguyen on 09/01/2566 BE.
//

import UIKit

class OTPInputForm: MasterView, UITextFieldDelegate {
    
    private let containerView = UIView()
    
    private let hStackContainer: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        return stack
    }()
    
    private var inputField0 = MasterTextField()
    
    private var inputField1 = MasterTextField()
    
    private var inputField2 = MasterTextField()
    
    private var inputField3 = MasterTextField()

    override func setupViews() {
        super.setupViews()
        
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.hStackContainer)
        
        let views = [inputField0, inputField1, inputField2, inputField3]
        views.forEach { view in
            let getView = self.createSettingTextField(view)
            self.hStackContainer.insertArrangedSubview(getView, at: views.firstIndex(of: getView)!)
            getView.delegate = self
        }
    }

    override func setupLayoutSubviews() {
        super.setupLayoutSubviews()
        self.containerView.fillSuperview()
        self.hStackContainer.centerAllSuperview(self.containerView)
        self.hStackContainer.spacing = 10
        
        self.inputField0.anchorSize(size: CGSize(width: 78, height: 58))
        
        self.inputField1.anchorSize(size: CGSize(width: 78, height: 58))
        
        self.inputField2.anchorSize(size: CGSize(width: 78, height: 58))
        
        self.inputField3.anchorSize(size: CGSize(width: 78, height: 58))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(textField.text!.description)")
    }
}

extension OTPInputForm {
    
    func createSettingTextField(_ textField: MasterTextField) -> MasterTextField {
        textField.setBackgroundColor(color: .appResource.primaryBackgroundLight, for: .normal)
        textField.setBordered(color: .appResource.primaryGrey, width: 1, for: .normal)
        textField.textAlignment = .center
        textField.textColor = .appResource.textColor
        textField.font = .bold(size: .appResource.primaryTextSizeLarge18)
        textField.keyboardType = .numberPad
        return textField
    }
    
}


import SwiftUI

struct OTPInputForm_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: ResetPasswordViewController())
    }
}

