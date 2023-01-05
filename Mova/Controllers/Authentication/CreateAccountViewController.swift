//
//  CreateAccountViewController.swift
//  Mova
//
//  Created by HauNguyen on 03/01/2566 BE.
//

import UIKit

class CreateAccountViewController: BaseViewController {
    
    private let containerView = UIView()
    
    private let headerNavBar: HeaderNavigationBar = {
        let header = HeaderNavigationBar()
        header.titleLabel.text = "Choose Your Interest"
         
        let button = MasterButton()
        button.setIcon(UIImage(named: "apple-icon"), color: .white, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        header.rightView = button
        
        return header
    }()
    
    private let vStackContainer: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        return _self
    }()
    
    private let vStackTextField: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        return _self
    }()
    
    private let imageView: UIImageView = {
        let _self = UIImageView()
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
        self.view.addSubview(self.containerView)
        self.containerView.backgroundColor = .primaryBackground
        self.containerView.addSubview(self.vStackContainer)
        self.containerView.addSubview(self.headerNavBar)
        
        // Container
        self.vStackContainer.insertArrangedSubview(self.imageView, at: 0)
        self.vStackContainer.insertArrangedSubview(self.titleLabel, at: 1)
        self.vStackContainer.insertArrangedSubview(self.vStackTextField, at: 2)
        self.vStackContainer.insertArrangedSubview(self.buttonSignUp, at: 3)
        self.vStackContainer.insertArrangedSubview(self.titleDivider, at: 4)
        self.vStackContainer.insertArrangedSubview(self.hStackButtonSocial, at: 5)
        self.vStackContainer.insertArrangedSubview(self.hStackFooter, at: 6)
        
        // Vertical Stack TextField
        self.vStackTextField.insertArrangedSubview(self.textFieldEmail, at: 0)
        self.vStackTextField.insertArrangedSubview(self.textFieldPassword, at: 1)
        self.vStackTextField.insertArrangedSubview(self.hStackCheckBox, at: 2)
        
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
        self.containerView.setupLayoutConstraint(self.view)
        
        self.headerNavBar.translatesAutoresizingMaskIntoConstraints = false
        self.headerNavBar.topAnchor.constraint(equalTo: self.containerView.safeAreaLayoutGuide.topAnchor).isActive = true
        self.headerNavBar.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        self.headerNavBar.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        
        self.vStackContainer.translatesAutoresizingMaskIntoConstraints = false
        self.vStackContainer.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 20).isActive = true
        self.vStackContainer.bottomAnchor.constraint(equalTo: self.containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        self.vStackContainer.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        self.vStackContainer.spacing = 35
        
        // Stack TextField
        self.vStackTextField.translatesAutoresizingMaskIntoConstraints = false
        self.vStackTextField.leftAnchor.constraint(equalTo: self.vStackContainer.leftAnchor).isActive = true
        self.vStackTextField.rightAnchor.constraint(equalTo: self.vStackContainer.rightAnchor).isActive = true
        self.vStackTextField.spacing = 20
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.widthAnchor.constraint(equalToConstant: UIScreen.size.width/5).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: UIScreen.size.width/5).isActive = true
        
        self.textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.textFieldEmail.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40).isActive = true
        self.textFieldEmail.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        self.textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.textFieldPassword.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40).isActive = true
        self.textFieldPassword.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        // Checkbox
        self.hStackCheckBox.translatesAutoresizingMaskIntoConstraints = false
        self.hStackCheckBox.spacing = 10
        
        self.titleDivider.translatesAutoresizingMaskIntoConstraints = false
        self.titleDivider.leftAnchor.constraint(equalTo: self.vStackContainer.leftAnchor).isActive = true
        self.titleDivider.rightAnchor.constraint(equalTo: self.vStackContainer.rightAnchor).isActive = true
        
        self.buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.buttonSignUp.leftAnchor.constraint(equalTo: self.vStackContainer.leftAnchor).isActive = true
        self.buttonSignUp.rightAnchor.constraint(equalTo: self.vStackContainer.rightAnchor).isActive = true
        
        self.hStackFooter.spacing = 10
        
        self.buttonFacebook.translatesAutoresizingMaskIntoConstraints = false
        self.buttonFacebook.widthAnchor.constraint(equalToConstant: 82).isActive = true
        self.buttonFacebook.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        self.buttonGoogle.translatesAutoresizingMaskIntoConstraints = false
        self.buttonGoogle.widthAnchor.constraint(equalToConstant: 82).isActive = true
        self.buttonGoogle.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        self.buttonApple.translatesAutoresizingMaskIntoConstraints = false
        self.buttonApple.widthAnchor.constraint(equalToConstant: 82).isActive = true
        self.buttonApple.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        self.hStackButtonSocial.spacing = 10
    }
    
}

import SwiftUI

struct CreateAccountViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: CreateAccountViewController())
    }
}
