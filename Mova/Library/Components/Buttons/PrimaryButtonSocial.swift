//
//  PrimaryButtonSocial.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit

class PrimaryButtonSocial: MasterButton {
    
    override func setupViews() {
        super.setupViews()
        let radius: CGFloat = .appResource.primaryButtonPopular.height/4
        self.setBackgroundColor(color: .appResource.primaryGreyDark, cornerRadius: radius, for: .normal)
        self.setBordered(color:  .appResource.primaryGrey, width: 1, cornerRadius: radius)
        self.titleLabel?.font = .semiBold(size: .appResource.primaryTextSizePopular)
        self.tintColor =  .appResource.textColor
    }

}

class PrimaryButtonGroundIcon: MasterButton {
    
    override func setupViews() {
        super.setupViews()
        let radius: CGFloat = .appResource.primaryButtonGroundSize.height/4
        self.setBackgroundColor(color: .appResource.primaryGreyDark, cornerRadius: radius, for: .normal)
        self.setBordered(color: .appResource.primaryGrey, width: 1, cornerRadius: radius)
    }
}
