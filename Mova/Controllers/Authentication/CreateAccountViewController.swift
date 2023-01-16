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
    private let headerNavBar: HeaderNavigationBar = HeaderNavigationBar()
    
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
        title.font = .bold(size: .appResource.primaryTextSizeLarge26)
        title.textColor = .appResource.textColor
        title.numberOfLines = 1
        title.text = "Create Your Account"
        title.textAlignment = .center
        return title
    }()
    
    private let textFieldEmail: AuthenTextField = {
        let tf = AuthenTextField()
        tf.setIconLeft(UIImage(named: "envelope-fill"), color: .appResource.placeholderColor, viewMode: .always)
        tf.setIconRight(UIImage(named: "cross-small"), color: .appResource.placeholderColor, viewMode: .whileEditing)
        tf.setPlaceholder("Email")
        tf.keyboardType = .emailAddress
        
        return tf
    }()
    
    private let textFieldPassword: AuthenTextField = {
        let tf = AuthenTextField()
        tf.setIconLeft(UIImage(named: "lock-fill"), color: .appResource.placeholderColor, viewMode: .always)
        tf.setIconRight(UIImage(named: "eye-fill"), color: .appResource.placeholderColor, viewMode: .always)
        tf.setPlaceholder("Password")
        tf.isSecureTextEntry = true
        tf.keyboardType = .default
        
        return tf
    }()
    
    private let checkBoxButton: CheckBox = {
        let checkBox = CheckBox()
        return checkBox
    }()
    
    private let titleRememberMe: UILabel = {
        let _self = UILabel()
        _self.text = "Remember me"
        _self.textColor = .appResource.textColor
        _self.font = .medium(size: .appResource.primaryTextSizeSmall)
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
        _self.font = .medium(size: .appResource.primaryTextSizeSmall)
        _self.textColor = .appResource.textColor
        _self.numberOfLines = 1
        _self.text = "Already have an account?"
        return _self
    }()
    
    private let buttonSignIn: MasterButton = {
        let button = MasterButton()
        button.setTitle(text: "Sign in", for: .normal)
        button.titleLabel?.font = .medium(size: .appResource.primaryTextSizePopular)
        button.setTitleColor(.appResource.primaryRed, for: .normal)
        return button
    }()
    
    private let hStackButtonSocial: UIStackView = {
        let _self = UIStackView()
        _self.axis = .horizontal
        _self.alignment = .center
        return _self
    }()
    
    private let buttonFacebook: PrimaryButtonGroundIcon = {
        let button = PrimaryButtonGroundIcon()
        button.setIcon(UIImage(named: "facebook_circle-icon"), for: .normal)
        return button
    }()
    
    private let buttonGoogle: PrimaryButtonGroundIcon = {
        let button = PrimaryButtonGroundIcon()
        button.setIcon(UIImage(named: "google-icon"), for: .normal)
        return button
    }()
    
    private let buttonApple: PrimaryButtonGroundIcon = {
        let button = PrimaryButtonGroundIcon()
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
        self.view.backgroundColor = .appResource.primaryBackground
        self.view.insertSubview(self.containerView, at: 0)
        self.view.insertSubview(self.headerNavBar, at: 1)
        
        let views = [imageView, titleLabel, vStackTextField, hStackCheckBox, buttonSignUp, titleDivider, hStackButtonSocial, hStackFooter]
        views.forEach { view in
            self.containerView.insertSubview(view, at: views.firstIndex(of: view)!)
        }
        
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
        
        self.textFieldEmail.setIconRightAction(self.rightMailAction)
        
        self.textFieldPassword.setIconRightAction(self.rightPasswordAction)
        
        self.checkBoxButton.blockAction(self.checkBoxAction)
        
        self.headerNavBar.leftAction(self.headerBackButton)
        
        self.buttonSignUp.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        
        self.buttonSignIn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        self.checkBoxButton.addTarget(self, action: #selector(rememberAction), for: .touchUpInside)
        
        self.buttonFacebook.addTarget(self, action: #selector(facebookAction), for: .touchUpInside)
        
        self.buttonGoogle.addTarget(self, action: #selector(googleAction), for: .touchUpInside)
        
        self.buttonApple.addTarget(self, action: #selector(appleAction), for: .touchUpInside)
        
        self.containerView.addGestureRecognizer(.tapGesture(target: self, action: #selector(dismissKeyboard)))
    }
    
    private func rightMailAction() {
        self.textFieldEmail.text = ""
    }
    
    private func rightPasswordAction() {
        self.textFieldPassword.isSecureTextEntry.toggle()
        self.textFieldPassword.setIconRight(UIImage(named: self.textFieldPassword.isSecureTextEntry ? "eye" : "eye-fill"), color: .appResource.placeholderColor, viewMode: .always)
    }
    
    private func checkBoxAction(_ state: Bool) {
        print(">>>: \(state)")
    }
    
    private func headerBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func signUpAction() {
        
    }
    
    @objc private func signInAction() {
        self.navigationController?.pushViewController(LoginAccountViewController(), animated: true)
    }
    
    @objc private func rememberAction() {
        print("Remember")
    }
    
    @objc private func facebookAction() {
        print("facebookAction")
    }
    
    @objc private func googleAction() {
        print("googleAction")
    }
    
    @objc private func appleAction() {
        print("applekAction")
    }
    
}

// Setup layouts
extension CreateAccountViewController {
    
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
            trailing: self.containerView.trailingAnchor
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
            size: CGSize(width: 0, height: 55)
        )
        self.hStackCheckBox.centerXSuperview(self.containerView)
        self.hStackCheckBox.spacing = 10
        
        self.buttonSignUp.anchor(
            top: self.hStackCheckBox.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: self.titleDivider.topAnchor,
            trailing: self.containerView.trailingAnchor,
            size: CGSize(width: 0, height: 55)
        )
        self.buttonSignUp.centerXSuperview(self.vStackTextField)
        
        self.titleDivider.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: self.hStackButtonSocial.topAnchor,
            trailing: self.containerView.trailingAnchor,
            size: CGSize(width: 0, height: 55)
        )
        self.titleDivider.centerXSuperview(self.vStackTextField)
        
        self.hStackButtonSocial.anchor(
            top: self.titleDivider.bottomAnchor,
            leading: nil,
            bottom: self.hStackFooter.topAnchor,
            trailing: nil
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
            size: CGSize(width: 0, height: 55)
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
