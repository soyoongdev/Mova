//
//  Extension+UIView.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

public extension UIView {
    
    class func blurView(frame: CGRect) -> UIView {
        let effectView = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        effectView.effect = blurEffect
        effectView.frame = frame
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return effectView
    }
    
    func setupConstraintLayout(superView viewController: UIViewController, isSafeAreaLayout: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: isSafeAreaLayout ? viewController.view.safeAreaLayoutGuide.topAnchor : viewController.view.topAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: viewController.view.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: viewController.view.leftAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: isSafeAreaLayout ? viewController.view.safeAreaLayoutGuide.bottomAnchor : viewController.view.bottomAnchor).isActive = true
    }
    
    func setupConstraintLayout(superView view: UIView, isSafeAreaLayout: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor).isActive = true
    }
    
}
