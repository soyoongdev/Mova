//
//  PrimaryButton.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit
import SwiftUI

class PrimaryButton: MasterButton {
    
    convenience init(frame: CGRect, label: String, fontSize: CGFloat) {
        self.init(frame: frame)
    }
    
    lazy var roundRectangleView: UIButton = {
        return UIButton(frame: .zero)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView(frame)
        self.setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(_ frame: CGRect) {
        self.roundRectangleView.frame = frame
        self.roundRectangleView.backgroundColor = .red
        self.roundRectangleView.setTitle("Button", for: .normal)
        self.roundRectangleView.setTitleColor(.white, for: .normal)
        self.roundRectangleView.titleLabel?.font = UIFont.regular(size: 14)
        self.addSubview(self.roundRectangleView)
    }
    
    private func setupLayouts() {
//        self.roundRectangleView.setupConstraintLayout(superView: self)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIView(view: PrimaryButton(frame: .init(origin: .zero, size: CGSize(width: 80, height: 32))))
    }
}
