//
//  CreateAccountViewController.swift
//  Mova
//
//  Created by HauNguyen on 03/01/2566 BE.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
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
        _self.font = .bold(size: .large26)
        _self.textColor = .textColor
        _self.numberOfLines = 1
        _self.text = "Create Your Account"
        return _self
    }()
    
    private let textFieldEmail: AuthenTextField = {
        let tf = AuthenTextField()
        tf.setIconLeft(UIImage(named: "envelope-fill"), color: .placeholder, for: .normal)
        tf.setIconRight(UIImage(named: "cross-small"), color: .placeholder, for: .normal)
        tf.rightViewMode = .whileEditing
        tf.setPlaceholder("Email")
        
        return tf
    }()
    
    private let textFieldPassword: AuthenTextField = {
        let tf = AuthenTextField()
        tf.setIconLeft(UIImage(named: "lock-fill"), color: .placeholder, for: .normal)
        tf.setIconRight(UIImage(named: "eye-fill"), color: .placeholder, for: .normal)
        tf.rightViewMode = .whileEditing
        tf.setPlaceholder("Password")
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    private let checkBoxButton: CheckBox = CheckBox()
    
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
        self.setupSubViewLayouts()
    }
    
    private func setupViews() {
        self.setupSubViews()
        
        self.textFieldEmail.setIconRightAction(self.rightMailAction)
        self.textFieldPassword.setIconRightAction(self.rightPasswordAction)
        self.checkBoxButton.blockAction(self.checkBoxAction)
        
    }
    
    private func rightMailAction() {
        self.textFieldEmail.text = ""
    }
    
    private func rightPasswordAction() {
        self.textFieldPassword.setIconRight(UIImage(named: self.textFieldPassword.isSecureTextEntry ? "eye" : "eye-fill"), color: .placeholder)
        self.textFieldPassword.isSecureTextEntry.toggle()
    }
    
    private func checkBoxAction(_ state: Bool) {
        print(">>>: \(state)")
    }
    
}

// Setup layouts
extension CreateAccountViewController {
    
    private func setupSubViews() {
        self.view.addSubview(self.containerView)
        self.containerView.backgroundColor = .primaryBackground
        self.containerView.addSubview(self.vStackContainer)
        
        self.vStackContainer.insertArrangedSubview(self.imageView, at: 0)
        self.vStackContainer.insertArrangedSubview(self.titleLabel, at: 1)
        self.vStackContainer.insertArrangedSubview(self.vStackButtonSocial, at: 2)
        self.vStackContainer.insertArrangedSubview(self.titleDivider, at: 3)
        self.vStackContainer.insertArrangedSubview(self.buttonSignIn, at: 4)
        self.vStackContainer.insertArrangedSubview(self.hStackFooter, at: 5)
        
        self.vStackButtonSocial.insertArrangedSubview(self.textFieldEmail, at: 0)
        self.vStackButtonSocial.insertArrangedSubview(self.textFieldPassword, at: 1)
        self.vStackButtonSocial.insertArrangedSubview(self.checkBoxButton, at: 2)
        
        self.hStackFooter.insertArrangedSubview(self.titleLabelFooter, at: 0)
        self.hStackFooter.insertArrangedSubview(self.buttonSignUp, at: 1)
    }
    
    private func setupSubViewLayouts() {
        self.containerView.setupLayoutConstraint(self.view)
        
        self.vStackContainer.translatesAutoresizingMaskIntoConstraints = false
        self.vStackContainer.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 20).isActive = true
        self.vStackContainer.bottomAnchor.constraint(equalTo: self.containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        self.vStackContainer.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        self.vStackContainer.spacing = 35
        
        self.textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.textFieldEmail.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40).isActive = true
        self.textFieldEmail.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        self.textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.textFieldPassword.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40).isActive = true
        self.textFieldPassword.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
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
        
        self.checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

import SwiftUI

struct CreateAccountViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: CreateAccountViewController())
    }
}
