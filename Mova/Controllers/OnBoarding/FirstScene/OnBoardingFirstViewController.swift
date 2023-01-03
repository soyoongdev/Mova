//
//  DashboardView.swift
//  Mova
//
//  Created by HauNguyen on 27/12/2565 BE.
//

import UIKit
import NVActivityIndicatorView

class OnBoardingFirstViewController: UIViewController {
        
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
        indicator.color = UIColor.primaryRed
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupLayouts()
    }
    
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .primaryBackground
        self.view.addSubview(self.logoImage)
        self.view.addSubview(self.loadingIndicator)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigationController?.pushViewController(OnBoardingSecondViewController(), animated: true)
            self.loadingIndicator.stopAnimating()
        }
    }
    
    private func setupLayouts() {
        // Logo
        self.logoImage.translatesAutoresizingMaskIntoConstraints = false
        self.logoImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        self.logoImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        self.logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.logoImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // Progress indicator
        self.loadingIndicator.startAnimating()
        self.loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.loadingIndicator.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor).isActive = true
        self.loadingIndicator.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.loadingIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
}

import SwiftUI

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: OnBoardingFirstViewController())
    }
}

