//
//  CheckBox.swift
//  Mova
//
//  Created by HauNguyen on 04/01/2566 BE.
//

import UIKit

class CheckBox: MasterButton {
    
    var isChecked: Bool = false
    
    private var makeAction: ((Bool) -> Void)?
    
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
        self.setBordered(color: .appResource.primaryRed, width: 2.5, cornerRadius: 6.0)
        self.addSubview(self.checkImageView)
        self.bringSubviewToFront(self.checkImageView)
        self.checkImageView.isHidden = !self.isChecked
        self.addTarget(self, action: #selector(self.checkBoxAction), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.checkImageView.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: self.widthBox).isActive = true
        self.heightAnchor.constraint(equalToConstant: self.heightBox).isActive = true
        self.checkImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.checkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func blockAction(_ action: @escaping (Bool) -> Void) {
        self.makeAction = action
    }

    @objc private func checkBoxAction() {
        self.isChecked.toggle()
        self.checkImageView.isHidden = !self.isChecked
        self.backgroundColor = self.checkImageView.isHidden ? .clear : .appResource.primaryRed
        self.makeAction?(self.isChecked)
    }
}

import SwiftUI

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: CreateAccountViewController())
    }
}

