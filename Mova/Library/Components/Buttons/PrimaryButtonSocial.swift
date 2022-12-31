//
//  PrimaryButtonSocial.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit

class PrimaryButtonSocial: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        self.backgroundColor = .primaryBackground
        self.layer.borderWidth = 1
    }

}


import SwiftUI

struct PrimaryButtonSocial_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIView(view: PrimaryButtonSocial())
    }
}

