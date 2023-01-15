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
        let radius: CGFloat = .appResource.primaryButtonPopular.height/2
        self.setBackgroundColor(color: .appResource.primaryRed, cornerRadius: radius, for: .normal)
        self.titleLabel?.font = .semiBold(size: .appResource.primaryTextSizePopular)
        self.setTitleColor(.appResource.textColor, for: .normal)
        let space: CGFloat = 16.0
        self.contentEdgeInsets = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    }
    
}

import SwiftUI

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: AuthenticationSelectionViewController())
    }
}

