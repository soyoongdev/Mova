//
//  PrimaryButton.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit


class PrimaryButton: MasterButton {
    
    override func setupViews() {
        super.setupViews()
        self.setBackgroundColor(color: .primaryRed, for: .normal)
        self.titleLabel?.font = .semiBold(size: .small)
        self.setTitleColor(.textColor, for: .normal)
        let space: CGFloat = 16.0
        self.contentEdgeInsets = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        self.layer.cornerRadius = self.bounds.height/2
    }
    
}
