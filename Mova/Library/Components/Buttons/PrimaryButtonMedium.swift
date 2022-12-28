//
//  PrimaryButtonMedium.swift
//  Mova
//
//  Created by HauNguyen on 13/12/2565 BE.
//

import UIKit

class PrimaryButtonMedium: MasterButton, MasterButtonDelegate {

    override func setupViews() {
        super.setupViews()
        
        self.setBackgroundType(type: .fill)
        self.setButtonStyle(style: .medium)
        self.setTitle(color: .textColor, font: .bold(size: .medium))
    }

}
