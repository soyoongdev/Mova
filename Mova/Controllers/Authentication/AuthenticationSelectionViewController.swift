//
//  AuthenticationSelectionViewController.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit

class AuthenticationSelectionViewController: UIViewController {
    
    private let vStack: UIStackView = {
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
        
        self.view.addSubview(self.vStack)
        
        self.vStack.addArrangedSubview(self.imageView)
        self.vStack.addArrangedSubview(self.titleLabel)
    }
    
    private func setupLayouts() {
        self.vStack.translatesAutoresizingMaskIntoConstraints = false
        self.vStack.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.vStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.vStack.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.vStack.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.vStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

}


import SwiftUI

struct AuthenticationSelectionViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: AuthenticationSelectionViewController())
    }
}

