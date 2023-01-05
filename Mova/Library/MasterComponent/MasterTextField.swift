//
//  MasterTextField.swift
//  Mova
//
//  Created by HauNguyen on 03/01/2566 BE.
//

import UIKit
import Foundation

class MasterTextField: UITextField {
    
    private lazy var backgroundNormal: UIColor? = .clear
    
    private lazy var backgroundSelected: UIColor? = .clear
    
    private lazy var layerNormal: CALayer? = nil
    
    private lazy var layerSelected: CALayer? = nil
    
    private var leftViewAction: (() -> Void)?
    
    private var rightViewAction: (() -> Void)?
    
    var contentInsets: UIEdgeInsets? = .zero {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var contentPaddingVertical: CGFloat? = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var contentPaddingHorizontal: CGFloat? = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var inputPaddingHorizontal: CGFloat? = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var inputPaddingVertical: CGFloat? = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupViews()
    }
    
    func setupViews() {
        self.delegate = self
    }
    
    func setIconLeft(_ image: UIImage? = nil, color: UIColor? = nil, size: CGFloat? = 16.0, viewMode mode: UITextField.ViewMode? = .never) {
        var getImage = image?.resize(with: size!)
        if color != nil {
            getImage = getImage?.tintColor(color!)
        }
        let imageView = UIImageView()
        imageView.image = getImage
        imageView.contentMode = .scaleAspectFit
        
        let button = MasterButton()
        button.addSubview(imageView)
        button.addTarget(self, action: #selector(self.blockActionLeft), for: .touchUpInside)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: size!).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: size!).isActive = true
        imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        
        self.leftView = button
        self.leftViewMode = mode!
    }
    
    func setIconRight(_ image: UIImage? = nil, color: UIColor? = nil, size: CGFloat? = 16.0, viewMode mode: UITextField.ViewMode? = .never) {
        var getImage = image?.resize(with: size!)
        if color != nil {
            getImage = getImage?.tintColor(color!)
        }
        let imageView = UIImageView()
        imageView.image = getImage
        imageView.contentMode = .scaleAspectFit
        
        let button = MasterButton()
        button.addSubview(imageView)
        button.addTarget(self, action: #selector(self.blockActionRight), for: .touchUpInside)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: size!).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: size!).isActive = true
        imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        
        self.rightView = button
        self.rightViewMode = mode!
    }
    
    func setIconLeftAction(_ action: @escaping () -> Void) {
        self.leftViewAction = action
    }
    
    func setIconRightAction(_ action: @escaping () -> Void) {
        self.rightViewAction = action
    }
    
    func setPlaceholder(_ string: String? = "", color: UIColor? = .placeholder, textSize: CGFloat? = 14.0, font: UIFont? = nil) {
        self.attributedPlaceholder = NSAttributedString(
            string: string!,
            attributes: [
                .foregroundColor: color!,
                .font: (font ?? .regular(size: textSize!)!)
            ]
        )
    }
    
    func setBackgroundColor(color: UIColor, cornerRadius: CGFloat? = 12.0, for state: UIControl.State) {
        if state == .normal {
            self.backgroundNormal = color
            self.backgroundColor = color
        } else {
            self.backgroundSelected = color
        }
        self.layer.cornerRadius = cornerRadius!
    }
    
    func setBordered(color: UIColor, width: CGFloat? = 6, cornerRadius: CGFloat? = 14.0, for state: UIControl.State) {
        let layer = CALayer()
        layer.borderWidth = width!
        layer.borderColor = color.cgColor
        layer.cornerRadius = cornerRadius!
        
        if state == .normal {
            self.layerNormal = layer
            self.makeBordered(layer)
        } else {
            self.layerSelected = layer
        }
        
    }
    
    private func makeBordered(_ layer: CALayer) {
        self.layer.borderColor = layer.borderColor!
        self.layer.borderWidth = layer.borderWidth
        self.layer.cornerRadius = layer.cornerRadius
    }
    
    @objc private func blockActionLeft() {
        self.leftViewAction?()
    }
    
    @objc private func blockActionRight() {
        self.rightViewAction?()
    }
}

extension MasterTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.backgroundColor = self.backgroundSelected
        if self.layerSelected != nil {
            self.makeBordered(self.layerSelected!)
        } else {
            self.makeBordered(self.layerNormal!)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.backgroundColor = self.backgroundNormal
        if self.layerNormal != nil {
            self.makeBordered(self.layerNormal!)
        } else {
            self.makeBordered(self.layerSelected!)
        }
    }
    
}

extension MasterTextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        rect.origin.x += self.inputPaddingHorizontal!
        rect.size.width -= ((self.inputPaddingHorizontal! * 2) + self.contentPaddingHorizontal!)
        return rect
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.placeholderRect(forBounds: bounds)
        return rect
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.editingRect(forBounds: bounds)
        rect.origin.x += self.inputPaddingHorizontal!
        rect.size.width -= ((self.inputPaddingHorizontal! * 2) + self.contentPaddingHorizontal!)
        return rect
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += self.contentPaddingHorizontal!
        return rect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= self.contentPaddingHorizontal!
        return rect
    }
    
    override var alignmentRectInsets: UIEdgeInsets {
        return self.contentInsets!
    }
    
}

