//
//  AuthenticationSelectionViewController.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit

class AuthenticationSelectionViewController: UIViewController {
    
    private let vStackContainer: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        _self.spacing = 20
        return _self
    }()
    
    private let vStackButtonSocial: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        _self.spacing = 14
        return _self
    }()
    
    private let imageView: UIImageView = {
        let size = UIScreen.size.width/3
        let _self = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        _self.image = UIImage(named: "logo-mova")
        _self.contentMode = .scaleAspectFit
        
        return _self
    }()
    
    private let titleLabel: UILabel = {
        let _self = UILabel()
        _self.font = .bold(size: .extra42)
        _self.textColor = .textColor
        _self.numberOfLines = 1
        _self.text = "Let's you in"
        return _self
    }()
    
    private let facebookButton: PrimaryButtonSocial = {
        let button = PrimaryButtonSocial(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.size.width, height: 55)))
        button.setTitle(text: "Continue with Facebook", color: .textColor, for: .normal)
        button.setIcon(UIImage(named: "facebook-circle"), for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupLayouts()
    }
    
    private func setupViews() {
        self.view.backgroundColor = .primaryBackground
        
        self.view.addSubview(self.vStackContainer)
        
        self.vStackContainer.addArrangedSubview(self.imageView)
        self.vStackContainer.addArrangedSubview(self.titleLabel)
        self.vStackContainer.addArrangedSubview(self.vStackButtonSocial)
        
        self.vStackButtonSocial.addArrangedSubview(self.facebookButton)
    }
    
    private func setupLayouts() {
        self.vStackContainer.translatesAutoresizingMaskIntoConstraints = false
        self.vStackContainer.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.vStackContainer.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        self.vStackContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.vStackContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.facebookButton.translatesAutoresizingMaskIntoConstraints = false
        self.facebookButton.leftAnchor.constraint(equalTo: self.vStackContainer.leftAnchor).isActive = true
        self.facebookButton.rightAnchor.constraint(equalTo: self.vStackContainer.rightAnchor).isActive = true
    }

}


import SwiftUI

struct AuthenticationSelectionViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: AuthenticationSelectionViewController())
    }
}

