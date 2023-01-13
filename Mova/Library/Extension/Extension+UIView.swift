//
//  Extension+UIView.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIView {
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
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
    
    func fillSuperview(_ view: UIView? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let _view = view {
            self.anchor(top: _view.topAnchor, leading: _view.leadingAnchor, bottom: _view.bottomAnchor, trailing: _view.trailingAnchor)
        } else {
            self.anchor(top: self.superview?.topAnchor, leading: self.superview?.leadingAnchor, bottom: self.superview?.bottomAnchor, trailing: self.superview?.trailingAnchor)
        }
    }
    
    func anchorSize(to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func centerAllSuperview(_ view: UIView? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let _view = view {
            self.centerXAnchor.constraint(equalTo: _view.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: _view.centerYAnchor).isActive = true
        } else {
            self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
        }
    }
    
    func centerXSuperview(_ view: UIView? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let _view = view {
            self.centerXAnchor.constraint(equalTo: _view.centerXAnchor).isActive = true
        } else {
            self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
        }
    }
    
    func centerYSuperview(_ view: UIView? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let _view = view {
            self.centerYAnchor.constraint(equalTo: _view.centerYAnchor).isActive = true
        } else {
            self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
        }
    }
    
    func anchorSize(size: CGSize) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if size.width != 0 {
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        
        if size.width != 0 {
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
}
