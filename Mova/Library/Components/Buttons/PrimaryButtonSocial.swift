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
        self.setBackgroundColor(color: .primaryBackgroundLight, for: .normal)
        self.setBordered(color: .grayOutline, width: 1)
        self.titleLabel?.font = .semiBold(size: .small)
        self.tintColor = .textColor
    }

}

import SwiftUI

struct PrimaryButtonSocial_Previews: PreviewProvider {
    static var previews: some View {
//        PreviewUIView(view: PrimaryButtonSocial())
        PreviewUIViewController(viewController: AuthenticationSelectionViewController())
    }
}

