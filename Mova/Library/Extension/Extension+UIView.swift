//
//  Extension+UIView.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIView {
    
    class func blurView(frame: CGRect) -> UIView {
        let effectView = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        effectView.effect = blurEffect
        effectView.frame = frame
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return effectView
    }
    
    func addDrawRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.clear.cgColor
    }
}

extension UIView {
    
    func setupLayoutConstraint(superView viewController: UIViewController, isSafeAreaLayout: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: isSafeAreaLayout ? viewController.view.safeAreaLayoutGuide.topAnchor : viewController.view.topAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: viewController.view.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: viewController.view.leftAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: isSafeAreaLayout ? viewController.view.safeAreaLayoutGuide.bottomAnchor : viewController.view.bottomAnchor).isActive = true
    }
    
    func setupLayoutConstraint(superView view: UIView, isSafeAreaLayout: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor).isActive = true
    }
    
    func setupLayoutConstraint(attributes: [NSLayoutConstraint.Attribute], layoutMargins: UIEdgeInsets? = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), superView view: UIView, isSafeAreaLayout: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        for attribute in attributes {
            switch attribute {
            case .left:
                self.leftAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.leftAnchor : view.leftAnchor, constant: layoutMargins!.top).isActive = true
            case .right:
                self.rightAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.rightAnchor : view.rightAnchor, constant: layoutMargins!.right).isActive = true
            case .top:
                self.topAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor, constant: layoutMargins!.top).isActive = true
            case .bottom:
                self.bottomAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor, constant: layoutMargins!.bottom).isActive = true
            case .leading:
                self.leadingAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor, constant: layoutMargins!.left).isActive = true
            case .trailing:
                self.trailingAnchor.constraint(equalTo: isSafeAreaLayout ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor, constant: layoutMargins!.right).isActive = true
            case .width:
                self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            case .height:
                self.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            case .centerX:
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            case .centerY:
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            default:
                break;
            }
        }
        
    }
    
}
