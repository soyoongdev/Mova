//
//  Extension+UIButton.swift
//  Mova
//
//  Created by HauNguyen on 11/12/2565 BE.
//

import UIKit

extension UIButton {

    func setInsets(forContentPadding contentPadding: UIEdgeInsets, imageTitlePadding: CGFloat) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
    
    func setPadding(_ padding: CGFloat) {
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: padding/2,
            bottom: 0,
            right: -padding/2
        )
        self.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -padding/2,
            bottom: 0,
            right: padding/2
        )
        self.contentEdgeInsets = UIEdgeInsets(
            top: 0,
            left: padding/2,
            bottom: 0,
            right: padding/2
        )
    }
    
    func setBackgroundColor(_ backgroundColor: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(.pixel(ofColor: backgroundColor), for: state)
    }
    
    enum CustomButtonType {
        case small
        case medium
        case bigger
    }
}

import SwiftUI

struct AuthenticationSelectionViewController2_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: AuthenticationSelectionViewController())
    }
}
