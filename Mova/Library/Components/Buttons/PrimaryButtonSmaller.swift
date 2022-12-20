//
//  PrimaryButtonSmaller.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit
import SwiftUI

class PrimaryButtonSmaller: MasterButton, MasterButtonDelegate {
    
    override func setupViews() {
        super.setupViews()
        
        self.setBackgroundType(type: .fill)
        self.setButtonStyle(style: .small)
        self.setTitle(color: .textColor, fontSize: .small)
        
    }

}

struct PrimaryButtonSmaller_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
