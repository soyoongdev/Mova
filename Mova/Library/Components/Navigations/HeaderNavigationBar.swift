//
//  HeaderNavigationBar.swift
//  Mova
//
//  Created by HauNguyen on 05/01/2566 BE.
//

import UIKit

class HeaderNavigationBar: MasterView {
    
    private var leftBlock: (() -> Void)?
        
    private let backButton: MasterButton = {
        let button = MasterButton()
        var uiimage = UIImage(named: "back-left")
        uiimage = uiimage?.resize(with: .appResource.primaryIconPopular)
        uiimage = uiimage?.tintColor(.white)
        button.setBackgroundImage(uiimage, for: .normal)
        return button
    }()
    
    var titleLabel: MasterLabel = {
        let label = MasterLabel()
        label.font = .bold(size: .appResource.primaryTextSizeLarge20)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var rightViewContainer: UIView = UIView()
    
    var rightView: UIView?
    
    override func setupViews() {
        super.setupViews()
        self.insertSubview(self.backButton, at: 0)
        self.insertSubview(self.titleLabel, at: 1)
        self.insertSubview(self.rightViewContainer, at: 2)
        self.anchorSize(size: CGSize(width: 0, height: .appResource.primaryButtonPopular.height))
        
        self.backButton.addTarget(self, action: #selector(self.leftBlockAction), for: .touchUpInside)
        
    }
    
    override func setupLayoutSubviews() {
        super.setupLayoutSubviews()
        
        self.backButton.anchor(
            top: nil,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0),
            size: CGSize(width: 30, height: 30)
        )
        self.backButton.centerYSuperview()
        
        self.titleLabel.anchor(
            top: nil,
            leading: self.backButton.trailingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        )
        self.titleLabel.centerYSuperview()
        
        self.rightViewContainer.anchor(
            top: nil,
            leading: self.titleLabel.trailingAnchor,
            bottom: nil,
            trailing: self.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20),
            size: CGSize(width: 30, height: 30)
        )
        self.rightViewContainer.centerYSuperview()
        
        if let rightView = self.rightView {
            self.rightViewContainer.addSubview(rightView)
            self.rightViewContainer.bringSubviewToFront(rightView)
        }
    }
    
    func leftAction(_ action: @escaping () -> Void) {
        self.leftBlock = action
    }
    
    @objc private func leftBlockAction() {
        self.leftBlock?()
    }

}

import SwiftUI

struct HeaderNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: CreateAccountViewController())
    }
}


