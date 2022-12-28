//
//  DashboardView.swift
//  Mova
//
//  Created by HauNguyen on 27/12/2565 BE.
//

import UIKit
import NVActivityIndicatorView

class DashboardFirstView: UIView {
    
    private var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(origin: .zero, size: .init(relative: 124, relative: 124))
        imageView.image = UIImage(named: "logo-mova")
        return imageView
    }()
    
    private var loadingIndicator: NVActivityIndicatorView = {
        let frame: CGRect = .init(origin: .zero, size: .init(relative: 55, relative: 55))
        let indicator = NVActivityIndicatorView(frame: frame)
        indicator.type = .ballSpinFadeLoader
        indicator.color = UIColor.primaryRed!
        return indicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayouts()
    }
    
    private func setupViews() {
        self.backgroundColor = .primaryBackground
        
        self.addSubview(self.logoImage)
        self.addSubview(self.loadingIndicator)
    }
    
    private func setupLayouts() {
        // Logo
        self.logoImage.translatesAutoresizingMaskIntoConstraints = false
        self.logoImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        self.logoImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        self.logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.logoImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        // Progress indicator
        self.loadingIndicator.startAnimating()
        self.loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.loadingIndicator.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor).isActive = true
        self.loadingIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}

import SwiftUI

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIView(view: DashboardFirstView())
    }
}

