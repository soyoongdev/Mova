//
//  PrimaryButton.swift
//  Mova
//
//  Created by HauNguyen on 30/12/2565 BE.
//

import UIKit

protocol PrimaryButtonDelegate: AnyObject {
    
    func setupViews()
    
}

class PrimaryButton: UIView {
    
    private var myButton: UIButton?
    
    private lazy var backgroundNormal: CAShapeLayer = CAShapeLayer()
    
    private lazy var backgroundSelected: CAShapeLayer = CAShapeLayer()
        
    weak var delegate: PrimaryButtonDelegate?
    
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
        self.makeSubviewConstraintLayouts()
    }
    
    private func setupViews() {
        self.makeSubview()
        self.delegate?.setupViews()
    }
    
    func setTitle(_ title: String, color: UIColor? = .textColor, for state: ButtonState) {
        self.myButton?.setTitle(title, for: .normal)
        self.myButton?.setTitleColor(color!, for: .normal)
    }
    
    func setTitle(_ title: String, colors: [UIColor]? = [.textColor], startPoint: DirectionPoint? = .left, endPoint: DirectionPoint? = .right, for state: ButtonState) {
        
        self.myButton?.titleLabel?.text = title
        
        let bounds: CGRect = (self.myButton?.titleLabel?.getFrame())!
        let gradient = self.getGradientLayer(colors: colors!, startPoint: startPoint!, endPoint: endPoint!, bounds: bounds)
        
        self.myButton?.setTitle(title, for: .normal)
        self.myButton?.setTitleColor(gradient.toColor(), for: .normal)
    }
    
    func setTitleFont(_ font: UIFont, for state: ButtonState) {
        self.myButton?.titleLabel?.font = font
    }
    
    func setBackgroundGradient(colors: [UIColor], startPoint: DirectionPoint? = .top, endPoint: DirectionPoint? = .bottom, for state: ButtonState) {
        
    }
    
    func setBackgroundColor(color: UIColor, cornerRadius: CGFloat? = 14.0, for state: ButtonState) {
//        self.backgroundNormal.frame = self.myButton!.bounds
//        self.backgroundNormal.fillColor = color.cgColor
        self.myButton?.setBackgroundColor(color, for: .normal)
        self.myButton?.layer.cornerRadius = cornerRadius!
        self.myButton?.layer.masksToBounds = true
    }
    
    func setBordered(width: CGFloat? = 6, color: UIColor, cornerRadius: CGFloat? = 14.0) {
        self.myButton?.layer.borderWidth = width!
        self.myButton?.layer.borderColor = color.cgColor
        self.myButton?.layer.cornerRadius = cornerRadius!
    }
    
    func setBordered(width: CGFloat? = 6, colors: [UIColor], startPoint: DirectionPoint? = .left, endPoint: DirectionPoint? = .right, cornerRadius: CGFloat? = 14.0) {
        
        let gradient = self.getGradientLayer(colors: colors, startPoint: startPoint!, endPoint: endPoint!, bounds: self.myButton!.bounds)

        let shape = CAShapeLayer()
        shape.lineWidth = width! * 2
        shape.path = UIBezierPath(roundedRect: self.myButton!.bounds, cornerRadius: cornerRadius!).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        gradient.mask = shape

        self.myButton?.layer.insertSublayer(gradient, at: 0)
        self.myButton?.layer.cornerRadius = cornerRadius!
        self.myButton?.clipsToBounds = true
    }
    
    func makeShadow(color: UIColor? = .primaryBackground, radius: CGFloat? = 6, opacity: Float? = 1, offset: CGSize? = CGSize(width: 6.0, height: 6.0), path: CGPath? = nil) {
        
        self.layer.shadowColor = color!.cgColor
        self.layer.shadowRadius = radius!
        self.layer.shadowOpacity = opacity!
        self.layer.shadowOffset = offset!
        if let _path = path {
            self.layer.shadowPath = _path
        }
        
        self.makeSubview()
    }
    
    private func makeSubview() {
        self.myButton = UIButton(frame: self.bounds)
        self.addSubview(self.myButton!)
    }
    
    private func makeSubviewConstraintLayouts() {
        self.myButton?.translatesAutoresizingMaskIntoConstraints = false
        self.myButton?.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.myButton?.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.myButton?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.myButton?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func getGradientLayer(colors: [UIColor], startPoint: DirectionPoint? = .left, endPoint: DirectionPoint? = .right, bounds: CGRect) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors.toCGColors
        gradient.startPoint = startPoint!.rawValue
        gradient.endPoint = endPoint!.rawValue
        
        return gradient
    }
}

extension PrimaryButton {
    
    enum ButtonState {
        case normal
        case selected
    }
    
}

class PrimaryButtonExample: UIView {
    
    private let primaryButton: PrimaryButton = {
        let button = PrimaryButton(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 200, height: 100)))
        button.setTitle("My Button", color: .red, for: .normal)
        button.setBackgroundColor(color: .black, for: .normal)
        
        return button
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
    }
    
    func setupViews() {
        self.addSubview(self.primaryButton)
    }
    
}


import SwiftUI

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIView(view: PrimaryButtonExample())
    }
}

