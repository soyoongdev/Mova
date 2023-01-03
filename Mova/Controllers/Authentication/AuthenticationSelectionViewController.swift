//
//  AuthenticationSelectionViewController.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit

class AuthenticationSelectionViewController: UIViewController {
    
    private let containerView = UIView()
    
    private let vStackContainer: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        return _self
    }()
    
    private let vStackButtonSocial: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
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
        let button = PrimaryButtonSocial(frame: CGRect(x: 0, y: 0, width: UIScreen.size.width - 40, height: 55))
        button.setTitle(text: "Continue with Facebook", color: .textColor, for: .normal)
        button.setIcon(UIImage(named: "facebook_circle-icon"), for: .normal)
        
        return button
    }()
    
    private let googleButton: PrimaryButtonSocial = {
        let button = PrimaryButtonSocial(frame: CGRect(x: 0, y: 0, width: UIScreen.size.width - 40, height: 55))
        button.setTitle(text: "Continue with Google", color: .textColor, for: .normal)
        button.setIcon(UIImage(named: "google-icon"), for: .normal)
        
        return button
    }()
    
    private let appleButton: PrimaryButtonSocial = {
        let button = PrimaryButtonSocial(frame: CGRect(x: 0, y: 0, width: UIScreen.size.width - 40, height: 55))
        button.setTitle(text: "Continue with Apple", color: .textColor, for: .normal)
        button.setIcon(UIImage(named: "apple-icon"), color: .white, for: .normal)
        
        return button
    }()
    
    private let titleDivider: TextableDivider = {
        let _self = TextableDivider()
        _self.titleLabel.text = "or"
        return _self
    }()
    
    /// Button get started to skip onboarding
    private let buttonSignIn: PrimaryButton = {
        let button = PrimaryButton(frame: CGRect(origin: .zero, size: CGSize(relative: 350, relative: 52)))
        button.setTitle(text: "Sign in with password", for: .normal)
        return button
    }()
    
    private let hStackFooter: UIStackView = {
        let _self = UIStackView()
        _self.axis = .horizontal
        _self.alignment = .center
        return _self
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
        self.view.addSubview(self.containerView)
        self.containerView.backgroundColor = .primaryBackground
        self.containerView.addSubview(self.vStackContainer)
        
        self.vStackContainer.insertArrangedSubview(self.imageView, at: 0)
        self.vStackContainer.insertArrangedSubview(self.titleLabel, at: 1)
        self.vStackContainer.insertArrangedSubview(self.vStackButtonSocial, at: 2)
        self.vStackContainer.insertArrangedSubview(self.titleDivider, at: 3)
        self.vStackContainer.insertArrangedSubview(self.buttonSignIn, at: 4)
        self.vStackContainer.insertArrangedSubview(self.hStackFooter, at: 5)
        
        self.vStackButtonSocial.insertArrangedSubview(self.facebookButton, at: 0)
        self.vStackButtonSocial.insertArrangedSubview(self.googleButton, at: 1)
        self.vStackButtonSocial.insertArrangedSubview(self.appleButton, at: 2)
        
        self.hStackFooter.insertArrangedSubview(self.titleLabelFooter, at: 0)
        self.hStackFooter.insertArrangedSubview(self.buttonSignUp, at: 1)
        
    }
    
    private func setupLayouts() {
        self.containerView.setupLayoutConstraint(self.view)
        
        self.vStackContainer.translatesAutoresizingMaskIntoConstraints = false
        self.vStackContainer.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 20).isActive = true
        self.vStackContainer.bottomAnchor.constraint(equalTo: self.containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        self.vStackContainer.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        self.vStackContainer.spacing = 30
        
        self.facebookButton.translatesAutoresizingMaskIntoConstraints = false
        self.facebookButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40).isActive = true
        self.facebookButton.heightAnchor.constraint(equalToConstant: 55).isActive = true

        self.googleButton.translatesAutoresizingMaskIntoConstraints = false
        self.googleButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40).isActive = true
        self.googleButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        self.appleButton.translatesAutoresizingMaskIntoConstraints = false
        self.appleButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40).isActive = true
        self.appleButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        self.vStackButtonSocial.translatesAutoresizingMaskIntoConstraints = false
        self.vStackButtonSocial.leftAnchor.constraint(equalTo: self.vStackContainer.leftAnchor).isActive = true
        self.vStackButtonSocial.rightAnchor.constraint(equalTo: self.vStackContainer.rightAnchor).isActive = true
        self.vStackButtonSocial.spacing = 10
        
        
        self.titleDivider.translatesAutoresizingMaskIntoConstraints = false
        self.titleDivider.leftAnchor.constraint(equalTo: self.vStackContainer.leftAnchor).isActive = true
        self.titleDivider.rightAnchor.constraint(equalTo: self.vStackContainer.rightAnchor).isActive = true
        
        self.buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        self.buttonSignIn.leftAnchor.constraint(equalTo: self.vStackContainer.leftAnchor).isActive = true
        self.buttonSignIn.rightAnchor.constraint(equalTo: self.vStackContainer.rightAnchor).isActive = true
        
        self.hStackFooter.spacing = 10
        
        
    }

}


import SwiftUI

struct AuthenticationSelectionViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: AuthenticationSelectionViewController())
    }
}

