//
//  CheckBox.swift
//  Mova
//
//  Created by HauNguyen on 04/01/2566 BE.
//

import UIKit

class CheckBox: MasterButton {
    
    var isChecked: Bool = false
    
    private var blockAction: ((Bool) -> Void)?
    
    private let widthBox: CGFloat = 22.0
    private let heightBox: CGFloat = 22.0
    
    private lazy var checkImageView: UIImageView = {
        var image = UIImage(named: "check")
        image = image?.resize(with: self.widthBox/2)
        image = image?.tintColor(.white)
        
        let imgView = UIImageView()
        imgView.image = image
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    override func setupViews() {
        super.setupViews()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: self.widthBox).isActive = true
        self.heightAnchor.constraint(equalToConstant: self.heightBox).isActive = true
        self.setBordered(color: .primaryRed, width: 2.5, cornerRadius: 6.0)
        self.addTarget(self, action: #selector(self.checkBoxAction), for: .touchUpInside)
        self.addSubview(self.checkImageView)
        self.bringSubviewToFront(self.checkImageView)
        self.checkImageView.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.checkImageView.translatesAutoresizingMaskIntoConstraints = false
        self.checkImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.checkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

    @objc func checkBoxAction() {
        self.isChecked.toggle()
        self.checkImageView.isHidden = !self.isChecked
        self.backgroundColor = self.checkImageView.isHidden ? .clear : .primaryRed
    }
}

import SwiftUI

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: CreateAccountViewController())
    }
}

