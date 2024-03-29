//
//  ResetPasswordViewController.swift
//  Mova
//
//  Created by HauNguyen on 09/01/2566 BE.
//

import UIKit
import CHIOTPField

class ResetPasswordViewController: MasterViewController {
        
    private let containerView = UIView()
    
    private var headerNavBar: HeaderNavigationBar = {
        let header = HeaderNavigationBar()
        header.titleLabel.text = "Forgot Password"
        return header
    }()
    
    private let titleMessage: UILabel = {
        let title = UILabel()
        title.font = .medium(size: .appResource.primaryTextSizeLarge16)
        title.textColor = .appResource.textColor
        title.text = "Code has been send to +111******99"
        title.numberOfLines = .max
        title.textAlignment = .center
        return title
    }()
    
    private var secondCount: String = "0"
    
    private let titleMessageCount: UILabel = {
        let title = UILabel()
        title.font = .medium(size: .appResource.primaryTextSizeLarge16)
        title.textColor = .appResource.textColor
        title.text = "Resend code in 0"
        title.textAlignment = .center
        return title
    }()
    
    var otpField: CHIOTPFieldTwo = {
        let field = CHIOTPFieldTwo()
        field.numberOfDigits = 4
        field.spacing = 14
        let radius: CGFloat = .appResource.primaryButtonGroundSize.height/4
        field.cornerRadius = radius
        field.boxBackgroundColor = .appResource.primaryGreyDark
        field.activeBoxBackgroundColor = .appResource.primaryRedThinBlack
        field.filledBoxBackgroundColor = .appResource.primaryGreyDark
        field.borderColor = .appResource.primaryGrey
        field.activeBorderColor = .appResource.primaryRed
        field.tintColor = .appResource.primaryRed
        field.labels.forEach { label in
            label.textColor = .appResource.textColor
            label.font = .bold(size: .appResource.primaryTextSizeLarge20)
        }
        return field
    }()
    
    private let buttonVerify: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle(text: "Verify", for: .normal)
        return button
    }()
    
    private let buttonOTPCodeKeyboard: MasterButton = {
        let button = MasterButton()
        button.setTitle(text: "1234", for: .normal)
        return button
    }()
    
    private let buttonBarItem: UIBarButtonItem = {
        let item = UIBarButtonItem()
        item.tintColor = .appResource.primaryRed
        return item
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupLayoutSubviews()
    }
    
    private func setupViews() {
        self.view.backgroundColor = .appResource.primaryBackground
        self.view.insertSubview(containerView, at: 0)
        self.view.insertSubview(headerNavBar, at: 1)
        
        self.containerView.addSubview(titleMessage)
        self.containerView.addSubview(otpField)
        self.containerView.addSubview(titleMessageCount)
//        self.containerView.addSubview(buttonVerify)
        
        self.headerNavBar.leftAction(backButtonAction)
        
        self.buttonVerify.addTarget(self, action: #selector(verifyAction), for: .touchUpInside)
        self.otpField.inputAccessoryView = self.buttonVerify
        
        self.containerView.addGestureRecognizer(.tapGesture(target: self, action: #selector(dismissKeyboard)))
        
        self.buttonBarItem.customView = buttonOTPCodeKeyboard
        self.buttonOTPCodeKeyboard.addTarget(self, action: #selector(otpCodeMessageAction), for: .touchUpInside)
        
        self.otpField.toolbarAccessoryView([buttonBarItem])
        
        let range = (titleMessageCount.text! as NSString).range(of: secondCount)

        let attributedText = NSMutableAttributedString.init(string: titleMessageCount.text!)
        attributedText.addAttribute(.foregroundColor, value: UIColor.appResource.primaryRed , range: range)
        titleMessageCount.attributedText = attributedText
    }
    
    private func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func verifyAction() {
        print("Verified")
    }
    
    @objc private func otpCodeMessageAction() {
        if let otpCode = self.buttonOTPCodeKeyboard.titleLabel?.text {
            self.otpField.text = otpCode
        }
        self.dismissKeyboard()
    }
    
}

extension ResetPasswordViewController {
    
    private func setupLayoutSubviews() {
        self.headerNavBar.anchor(
            top: self.view.safeAreaLayoutGuide.topAnchor,
            leading: self.view.leadingAnchor,
            bottom: nil,
            trailing: self.view.trailingAnchor
        )
        
        self.containerView.anchor(
            top: self.view.topAnchor,
            leading: self.view.leadingAnchor,
            bottom: self.view.bottomAnchor,
            trailing: self.view.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
        )
        
        self.titleMessage.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor
        )
        
        self.otpField.anchor(
            top: self.titleMessage.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 0, height: .appResource.primaryButtonLarge.height)
        )
        self.otpField.centerAllSuperview(self.containerView)
        
        self.titleMessageCount.anchor(
            top: self.otpField.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        )
        
//        self.buttonVerify.anchor(
//            top: nil,
//            leading: self.containerView.leadingAnchor,
//            bottom: self.containerView.safeAreaLayoutGuide.bottomAnchor,
//            trailing: self.containerView.trailingAnchor,
//            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
//            size: CGSize(width: 0, height: 58)
//        )

    }
}

import SwiftUI

struct ResetPasswordViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: ResetPasswordViewController())
    }
}

