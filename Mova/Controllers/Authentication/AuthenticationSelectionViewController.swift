//
//  AuthenticationSelectionViewController.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit

class AuthenticationSelectionViewController: MasterViewController {
    
    private let containerView = UIView()
    
    private let headerNavBar: HeaderNavigationBar = {
        let header = HeaderNavigationBar()
        header.titleLabel.text = "Choose Your Interest"
        
        return header
    }()
    
    private let vStackButtonSocial: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    private let imageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo-mova")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .bold(size: .extra42)
        title.textColor = .textColor
        title.numberOfLines = 1
        title.text = "Let's you in"
        title.textAlignment = .center
        return title
    }()
    
    private let facebookButton: PrimaryButtonSocial = {
        let button = PrimaryButtonSocial()
        button.setTitle(text: "Continue with Facebook", color: .textColor, for: .normal)
        button.setIcon(UIImage(named: "facebook_circle-icon"), for: .normal)
        
        return button
    }()
    
    private let googleButton: PrimaryButtonSocial = {
        let button = PrimaryButtonSocial()
        button.setTitle(text: "Continue with Google", color: .textColor, for: .normal)
        button.setIcon(UIImage(named: "google-icon"), for: .normal)
        
        return button
    }()
    
    private let appleButton: PrimaryButtonSocial = {
        let button = PrimaryButtonSocial()
        button.setTitle(text: "Continue with Apple", color: .textColor, for: .normal)
        button.setIcon(UIImage(named: "apple-icon"), color: .white, for: .normal)
        
        return button
    }()
    
    private let titleDivider: TextableDivider = {
        let title = TextableDivider()
        title.titleLabel.text = "or"
        return title
    }()
    
    /// Button get started to skip onboarding
    private let buttonSignIn: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle(text: "Sign in with password", for: .normal)
        return button
    }()
    
    private let hStackFooter: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    private let titleLabelFooter: UILabel = {
        let _self = UILabel(frame: .zero)
        _self.font = .semiBold(size: .small)
        _self.textColor = .textColor
        _self.numberOfLines = 1
        _self.text = "Don't have an account?"
        return _self
    }()
    
    private let buttonSignUp: MasterButton = {
        let button = MasterButton()
        button.setTitle(text: "Sign up", for: .normal)
        button.titleLabel?.font = .semiBold(size: .small)
        button.setTitleColor(.primaryRed, for: .normal)
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
        self.setupSubviews()
        
        // Make action for sign in button
        self.buttonSignIn.addTarget(self, action: #selector(self.signInBtnAction), for: .touchUpInside)
    }
    
    @objc private func signInBtnAction() {
        UIView.animate(withDuration: 0.2) {
            self.navigationController?.pushViewController(CreateAccountViewController(), animated: true)
        }
    }

}

// Setup layouts
extension AuthenticationSelectionViewController {
    
    private func setupSubviews() {
        self.view.backgroundColor = .primaryBackground
        self.view.insertSubview(self.containerView, at: 0)
        self.view.insertSubview(self.headerNavBar, at: 1)
        
        self.containerView.insertSubview(self.imageView, at: 0)
        self.containerView.insertSubview(self.titleLabel, at: 1)
        self.containerView.insertSubview(self.vStackButtonSocial, at: 2)
        self.containerView.insertSubview(self.titleDivider, at: 3)
        self.containerView.insertSubview(self.buttonSignIn, at: 4)
        self.containerView.insertSubview(self.hStackFooter, at: 5)
        
        self.vStackButtonSocial.insertArrangedSubview(self.facebookButton, at: 0)
        self.vStackButtonSocial.insertArrangedSubview(self.googleButton, at: 1)
        self.vStackButtonSocial.insertArrangedSubview(self.appleButton, at: 2)
        
        self.hStackFooter.insertArrangedSubview(self.titleLabelFooter, at: 0)
        self.hStackFooter.insertArrangedSubview(self.buttonSignUp, at: 1)
    }
    
    private func setupLayouts() {
        self.containerView.anchor(
            top: self.view.topAnchor,
            leading: self.view.leadingAnchor,
            bottom: self.view.bottomAnchor,
            trailing: self.view.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
        )
        
        self.headerNavBar.anchor(
            top: self.view.safeAreaLayoutGuide.topAnchor,
            leading: self.view.leadingAnchor,
            bottom: nil,
            trailing: self.view.trailingAnchor
        )
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.widthAnchor.constraint(equalTo: self.containerView.widthAnchor, multiplier: 1/3).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: self.containerView.widthAnchor, multiplier: 1/3).isActive = true
        self.imageView.centerXSuperview(self.containerView)
        
        self.titleLabel.anchor(
            top: self.imageView.bottomAnchor,
            leading: nil,
            bottom: self.vStackButtonSocial.topAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 30, left: 0, bottom: -20, right: 0)
        )
        self.titleLabel.centerXSuperview(self.containerView)
        
        self.vStackButtonSocial.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        )
        self.vStackButtonSocial.spacing = 10
        
        self.facebookButton.anchor(
            top: nil,
            leading: self.vStackButtonSocial.leadingAnchor,
            bottom: nil,
            trailing: self.vStackButtonSocial.trailingAnchor,
            size: CGSize(width: 0, height: 55)
        )
        
        self.googleButton.anchor(
            top: nil,
            leading: self.vStackButtonSocial.leadingAnchor,
            bottom: nil,
            trailing: self.vStackButtonSocial.trailingAnchor,
            size: CGSize(width: 0, height: 55)
        )
        
        self.appleButton.anchor(
            top: nil,
            leading: self.vStackButtonSocial.leadingAnchor,
            bottom: nil,
            trailing: self.vStackButtonSocial.trailingAnchor,
            size: CGSize(width: 0, height: 55)
        )
        
        self.titleDivider.anchor(
            top: self.vStackButtonSocial.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        )
        
        self.buttonSignIn.anchor(
            top: self.titleDivider.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 55)
        )
        
        self.hStackFooter.anchor(
            top: self.buttonSignIn.bottomAnchor,
            leading: nil,
            bottom: self.containerView.safeAreaLayoutGuide.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 55)
        )
        self.hStackFooter.centerXSuperview(self.containerView)
        self.hStackFooter.spacing = 10
        
    }
    
}


import SwiftUI

struct AuthenticationSelectionViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: AuthenticationSelectionViewController())
    }
}

