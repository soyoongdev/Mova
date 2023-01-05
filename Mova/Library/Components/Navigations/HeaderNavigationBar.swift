//
//  HeaderNavigationBar.swift
//  Mova
//
//  Created by HauNguyen on 05/01/2566 BE.
//

import UIKit

class HeaderNavigationBar: MasterView {
    
    private var backBlockAction: (() -> Void)?
    
    private let backButton: MasterButton = {
        let button = MasterButton()
        var uiimage = UIImage(named: "back-left")
        uiimage = uiimage?.resize(with: 28.0)
        uiimage = uiimage?.tintColor(.white)
        button.setBackgroundImage(uiimage, for: .normal)
        return button
    }()
    
    var titleLabel: MasterLabel = {
        let label = MasterLabel()
        label.font = .bold(size: .large20)
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
        
        
        self.backButton.addTarget(self, action: #selector(self.leftBackAction), for: .touchUpInside)
    }
    
    override func setupLayoutSubviews() {
        super.setupLayoutSubviews()
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        self.backButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        self.backButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.backButton.rightAnchor, constant: 20).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightViewContainer.leftAnchor).isActive = true
        
        self.rightViewContainer.translatesAutoresizingMaskIntoConstraints = false
        self.rightViewContainer.widthAnchor.constraint(equalToConstant: 28.0).isActive = true
        self.rightViewContainer.heightAnchor.constraint(equalToConstant: 28.0).isActive = true
        self.rightViewContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.rightViewContainer.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        self.rightViewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        if let rightView = self.rightView {
            self.rightViewContainer.addSubview(rightView)
            self.rightViewContainer.bringSubviewToFront(rightView)
        }
        
    }
    
    func backAction(_ action: @escaping () -> Void) {
        self.backBlockAction = action
    }
    
    @objc private func leftBackAction() {
        self.backBlockAction?()
    }
    

}

import SwiftUI

struct HeaderNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: CreateAccountViewController())
    }
}


