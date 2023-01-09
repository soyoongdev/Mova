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
    
    private var inputField0: MasterTextField = {
        let field = MasterTextField()
        field.setBackgroundColor(color: .primaryBackgroundLight, for: .normal)
        field.setBordered(color: .grayOutline, width: 1, for: .normal)
        field.textAlignment = .center
        field.textColor = .textColor
        field.font = .bold(size: .large18)
        return field
    }()
    
    private var inputField1: MasterTextField = {
        let field = MasterTextField()
        field.setBackgroundColor(color: .primaryBackgroundLight, for: .normal)
        field.setBordered(color: .grayOutline, width: 1, for: .normal)
        field.textAlignment = .center
        field.textColor = .textColor
        field.font = .bold(size: .large18)
        return field
    }()
    
    private var inputField2: MasterTextField = {
        let field = MasterTextField()
        field.setBackgroundColor(color: .primaryBackgroundLight, for: .normal)
        field.setBordered(color: .grayOutline, width: 1, for: .normal)
        field.textAlignment = .center
        field.textColor = .textColor
        field.font = .bold(size: .large18)
        return field
    }()
    
    private var inputField3: MasterTextField = {
        let field = MasterTextField()
        field.setBackgroundColor(color: .primaryBackgroundLight, for: .normal)
        field.setBordered(color: .grayOutline, width: 1, for: .normal)
        field.textAlignment = .center
        field.textColor = .textColor
        field.font = .bold(size: .large18)
        return field
    }()

    override func setupViews() {
        super.setupViews()
        
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.hStackContainer)
        
        let views = [inputField0, inputField1, inputField2, inputField3]
        views.forEach { view in
            self.hStackContainer.insertArrangedSubview(view, at: views.firstIndex(of: view)!)
            view.delegate = self
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


import SwiftUI

struct OTPInputForm_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: ResetPasswordViewController())
    }
}

