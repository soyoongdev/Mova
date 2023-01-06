//
//  CreateAccountViewController.swift
//  Mova
//
//  Created by HauNguyen on 03/01/2566 BE.
//

import UIKit

class CreateAccountViewController: MasterViewController {
    
    private let containerView = UIView()
    
    private let vStackHeaderIntro: UIStackView = {
        let title = UIStackView()
        title.axis = .vertical
        title.alignment = .center
        return title
    }()
    private let headerNavBar: HeaderNavigationBar = {
        let header = HeaderNavigationBar()
        header.titleLabel.text = "Choose Your Interest"
         
//        let button = MasterButton()
//        button.setIcon(UIImage(named: "apple-icon"), color: .white, for: .normal)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
//
//        header.rightView = button
        
        return header
    }()
    
    private let vStackTextField: UIStackView = {
        let title = UIStackView()
        title.axis = .vertical
        title.alignment = .center
        return title
    }()
    
    private let imageView: UIImageView = {
        let title = UIImageView(image: UIImage(named: "logo-mova"))
        title.contentMode = .scaleAspectFit
        return title
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .bold(size: .large26)
        title.textColor = .textColor
        title.numberOfLines = 1
        title.text = "Create Your Account"
        title.textAlignment = .center
        return title
    }()
    
    private let textFieldEmail: AuthenTextField = {
        let tf = AuthenTextField()
        tf.setIconLeft(UIImage(named: "envelope-fill"), color: .placeholder, viewMode: .always)
        tf.setIconRight(UIImage(named: "cross-small"), color: .placeholder, viewMode: .whileEditing)
        tf.setPlaceholder("Email")
        tf.keyboardType = .emailAddress
        
        return tf
    }()
    
    private let textFieldPassword: AuthenTextField = {
        let tf = AuthenTextField()
        tf.setIconLeft(UIImage(named: "lock-fill"), color: .placeholder, viewMode: .always)
        tf.setIconRight(UIImage(named: "eye-fill"), color: .placeholder, viewMode: .always)
        tf.setPlaceholder("Password")
        tf.isSecureTextEntry = true
        tf.keyboardType = .default
        
        return tf
    }()
    
    private let checkBoxButton: CheckBox = {
        let checkBox = CheckBox()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()
    
    private let titleRememberMe: UILabel = {
        let _self = UILabel()
        _self.text = "Remember me"
        _self.textColor = .textColor
        _self.font = .semiBold(size: .small)
        return _self
    }()
    
    private let hStackCheckBox: UIStackView = {
        let _self = UIStackView()
        _self.axis = .horizontal
        _self.alignment = .center
        return _self
    }()
    
    private let titleDivider: TextableDivider = {
        let _self = TextableDivider()
        _self.titleLabel.text = "or continue with"
        return _self
    }()
    
    /// Button get started to skip onboarding
    private let buttonSignUp: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle(text: "Sign up", for: .normal)
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
        _self.text = "Already have an account?"
        return _self
    }()
    
    private let buttonSignIn: MasterButton = {
        let button = MasterButton()
        button.setTitle(text: "Sign in", for: .normal)
        button.titleLabel?.font = .semiBold(size: .small)
        button.setTitleColor(.primaryRed, for: .normal)
        return button
    }()
    
    private let hStackButtonSocial: UIStackView = {
        let _self = UIStackView()
        _self.axis = .horizontal
        _self.alignment = .center
        _self.translatesAutoresizingMaskIntoConstraints = false
        return _self
    }()
    
    private let buttonFacebook: PrimaryButtonSocialSmaller = {
        let button = PrimaryButtonSocialSmaller()
        button.setIcon(UIImage(named: "facebook_circle-icon"), for: .normal)
        return button
    }()
    
    private let buttonGoogle: PrimaryButtonSocialSmaller = {
        let button = PrimaryButtonSocialSmaller()
        button.setIcon(UIImage(named: "google-icon"), for: .normal)
        return button
    }()
    
    private let buttonApple: PrimaryButtonSocialSmaller = {
        let button = PrimaryButtonSocialSmaller()
        button.setIcon(UIImage(named: "apple-icon"), color: .white, for: .normal)
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
        self.headerNavBar.leftAction(self.headerBackButton)
    }
    
    private func rightMailAction() {
        self.textFieldEmail.text = ""
    }
    
    private func rightPasswordAction() {
        self.textFieldPassword.isSecureTextEntry.toggle()
        self.textFieldPassword.setIconRight(UIImage(named: self.textFieldPassword.isSecureTextEntry ? "eye" : "eye-fill"), color: .placeholder, viewMode: .always)
    }
    
    private func checkBoxAction(_ state: Bool) {
        print(">>>: \(state)")
    }
    
    private func headerBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// Setup layouts
extension CreateAccountViewController {
    
    private func setupSubViews() {
        self.view.backgroundColor = .primaryBackground
        self.view.insertSubview(self.containerView, at: 0)
        self.view.insertSubview(self.headerNavBar, at: 1)
        
        self.containerView.insertSubview(self.imageView, at: 0)
        self.containerView.insertSubview(self.titleLabel, at: 1)
        self.containerView.insertSubview(self.vStackTextField, at: 2)
        self.containerView.insertSubview(self.hStackCheckBox, at: 3)
        self.containerView.insertSubview(self.buttonSignUp, at: 4)
        self.containerView.insertSubview(self.titleDivider, at: 5)
        self.containerView.insertSubview(self.hStackButtonSocial, at: 6)
        self.containerView.insertSubview(self.hStackFooter, at: 7)
        
        // Vertical Stack TextField
        self.vStackTextField.insertArrangedSubview(self.textFieldEmail, at: 0)
        self.vStackTextField.insertArrangedSubview(self.textFieldPassword, at: 1)
        
        // Horizontal Stack checkbox
        self.hStackCheckBox.insertArrangedSubview(self.checkBoxButton, at: 0)
        self.hStackCheckBox.insertArrangedSubview(self.titleRememberMe, at: 1)
        
        // HStack Social
        self.hStackButtonSocial.insertArrangedSubview(self.buttonFacebook, at: 0)
        self.hStackButtonSocial.insertArrangedSubview(self.buttonGoogle, at: 1)
        self.hStackButtonSocial.insertArrangedSubview(self.buttonApple, at: 2)
        
        // Horizontal Stack Footer
        self.hStackFooter.insertArrangedSubview(self.titleLabelFooter, at: 0)
        self.hStackFooter.insertArrangedSubview(self.buttonSignIn, at: 1)
    }
    
    private func setupSubViewLayouts() {
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
        self.imageView.widthAnchor.constraint(equalTo: self.containerView.widthAnchor, multiplier: 1/4).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: self.containerView.widthAnchor, multiplier: 1/4).isActive = true
        self.imageView.centerXSuperview(self.containerView)
        
        self.titleLabel.anchor(
            top: self.imageView.bottomAnchor,
            leading: nil,
            bottom: self.vStackTextField.topAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 30, left: 0, bottom: -20, right: 0)
        )
        self.titleLabel.centerXSuperview(self.containerView)
        
        // Stack TextField
        self.vStackTextField.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        )
        self.vStackTextField.spacing = 10
        
        self.textFieldEmail.anchor(
            top: nil,
            leading: self.vStackTextField.leadingAnchor,
            bottom: nil,
            trailing: self.vStackTextField.trailingAnchor,
            size: CGSize(width: 0, height: 55)
        )
        self.textFieldEmail.centerXSuperview(self.vStackTextField)
        
        self.textFieldPassword.anchor(
            top: nil,
            leading: self.vStackTextField.leadingAnchor,
            bottom: nil,
            trailing: self.vStackTextField.trailingAnchor,
            size: CGSize(width: 0, height: 55)
        )
        self.textFieldPassword.centerXSuperview(self.vStackTextField)
        
        // Checkbox
        self.hStackCheckBox.anchor(
            top: self.vStackTextField.bottomAnchor,
            leading: nil,
            bottom: self.buttonSignUp.topAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 55)
        )
        self.hStackCheckBox.centerXSuperview(self.containerView)
        self.hStackCheckBox.spacing = 10
        
        self.buttonSignUp.anchor(
            top: self.hStackCheckBox.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: self.titleDivider.topAnchor,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 55)
        )
        self.buttonSignUp.centerXSuperview(self.vStackTextField)
        
        self.titleDivider.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: self.hStackButtonSocial.topAnchor,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 55)
        )
        self.titleDivider.centerXSuperview(self.vStackTextField)
        
        self.hStackButtonSocial.anchor(
            top: self.titleDivider.bottomAnchor,
            leading: nil,
            bottom: self.hStackFooter.topAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
        )
        self.hStackButtonSocial.centerXSuperview(self.containerView)
        self.hStackButtonSocial.spacing = 10
        
        self.buttonFacebook.anchorSize(size: CGSize(width: 82, height: 55))
        
        self.buttonGoogle.anchorSize(size: CGSize(width: 82, height: 55))
        
        self.buttonApple.anchorSize(size: CGSize(width: 82, height: 55))
        
        self.hStackFooter.anchor(
            top: self.hStackButtonSocial.bottomAnchor,
            leading: nil,
            bottom: self.containerView.safeAreaLayoutGuide.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        )
        self.hStackFooter.centerXSuperview(self.containerView)
        self.hStackFooter.spacing = 10
    }
    
}

import SwiftUI

struct CreateAccountViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: CreateAccountViewController())
    }
}
