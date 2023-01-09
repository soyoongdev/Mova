//
//  ResetPasswordViewController.swift
//  Mova
//
//  Created by HauNguyen on 09/01/2566 BE.
//

import UIKit

class ResetPasswordViewController: MasterViewController {
    
    private let containerView = UIView()
    
    var otpInputForm: OTPInputForm = {
        let form = OTPInputForm()
        
        return form
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
        self.view.addSubview(containerView)
        self.containerView.backgroundColor = .primaryBackground
        
        self.containerView.addSubview(otpInputForm)
    }
    
    private func setupLayoutSubviews() {
        self.containerView.fillSuperview(self.view)
        
        self.otpInputForm.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20),
            size: CGSize(width: 0, height: 58)
        )
        self.otpInputForm.centerYSuperview(self.containerView)
    }
    
}

import SwiftUI

struct ResetPasswordViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: ResetPasswordViewController())
    }
}

