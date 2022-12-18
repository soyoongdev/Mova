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
        
        self.setButtonStyle(type: .small, backgroundType: .fill)
        
    }

}

struct PrimaryButtonSmaller_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
