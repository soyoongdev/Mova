//
//  MasterButton.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit

class MasterButton: UIButton {
    
    private lazy var isImageExist: Bool = false
    
    private lazy var isTitleExist: Bool = false
            
    private var backgroundNormal: CALayer? = nil
    
    private var backgroundSelected: CALayer? = nil
    
    private var backgroundGradientNormal: CAGradientLayer? = nil
    
    private var backgroundGradientSelected: CAGradientLayer? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
    }
    
    func setupViews() {
        self.contentMode = .scaleAspectFit
    }
    
    func setTitle(text: String, color: UIColor? = nil, for state: ButtonState) {
        self.isTitleExist = true
        self.setTitle(text, for: state == .normal ? .normal : .highlighted)
        if let _color = color {
            self.setTitleColor(_color, for: state == .normal ? .normal : .highlighted)
        }
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
        self.bringSubviewToFront(self.titleLabel!)
    }
    
    func setTitle(text: String, colors: [UIColor]? = nil, startPoint: DirectionPoint? = .left, endPoint: DirectionPoint? = .right, for state: ButtonState) {
        self.isTitleExist = true
        
        if let _colors = colors {
            if state == .normal {
                let bounds: CGRect = self.titleLabel!.getFrame()
                let gradient = self.getGradientLayer(colors: _colors, startPoint: startPoint!, endPoint: endPoint!, bounds: bounds)
                self.setTitleColor(bounds.isEmpty ? .primaryBackground : gradient.toColor(), for: .normal)
            } else {
                let bounds: CGRect = self.titleLabel!.getFrame()
                let gradient = self.getGradientLayer(colors: _colors, startPoint: startPoint!, endPoint: endPoint!, bounds: bounds)
                self.setTitleColor(bounds.isEmpty ? .primaryBackground : gradient.toColor(), for: .highlighted)
            }
        }
        self.setTitle(text, for: state == .normal ? .normal : .highlighted)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 1
        self.bringSubviewToFront(self.titleLabel!)
        self.makeInsetsProgress()
    }
    
    func setIcon(_ image: UIImage?, color: UIColor? = nil, size: CGFloat? = nil, for state: ButtonState) {
        self.isImageExist = true
        var getImage = image?.resize(with: size ?? 24.0)
        
        if color != nil {
            getImage = getImage?.tintColor(color!)
        }
        
        self.setImage(getImage, for: state == .normal ? .normal : .highlighted)
        self.bringSubviewToFront(self.imageView!)
        self.makeInsetsProgress()
    }
    
    func setBackgroundGradient(colors: [UIColor], startPoint: DirectionPoint? = .left, endPoint: DirectionPoint? = .right, cornerRadius: CGFloat? = 14.0, for state: ButtonState) {
        
        if state == .normal {
            self.backgroundGradientNormal = CAGradientLayer()
            self.backgroundGradientNormal?.frame = self.bounds
            self.backgroundGradientNormal?.colors = colors.toCGColors
            self.backgroundGradientNormal?.startPoint = startPoint!.rawValue
            self.backgroundGradientNormal?.endPoint = endPoint!.rawValue
            self.layer.insertSublayer(self.backgroundGradientNormal!, at: 0)
        } else {
            self.backgroundGradientSelected = CAGradientLayer()
            self.backgroundGradientSelected?.frame = self.bounds
            self.backgroundGradientSelected?.colors = colors.toCGColors
            self.backgroundGradientSelected?.startPoint = startPoint!.rawValue
            self.backgroundGradientSelected?.endPoint = endPoint!.rawValue
            self.backgroundGradientSelected?.isHidden = (self.backgroundGradientNormal == nil)
            self.layer.insertSublayer(self.backgroundGradientSelected!, at: 0)
        }

        self.layer.cornerRadius = cornerRadius!
        self.layer.masksToBounds = true
        
    }
    
    func setBackgroundColor(color: UIColor, cornerRadius: CGFloat? = 14.0, for state: ButtonState) {
        
        if state == .normal {
            self.backgroundNormal = CALayer()
            self.backgroundNormal?.frame = self.bounds
            self.backgroundNormal?.backgroundColor = color.cgColor
            self.layer.insertSublayer(self.backgroundNormal!, at: 0)
        } else {
            self.backgroundSelected = CALayer()
            self.backgroundSelected?.frame = self.bounds
            self.backgroundSelected?.backgroundColor = color.cgColor
            self.backgroundSelected?.isHidden = (self.backgroundNormal == nil)
            self.layer.insertSublayer(self.backgroundSelected!, at: 0)
        }

        self.layer.cornerRadius = cornerRadius!
        self.layer.masksToBounds = true
        
    }
    
    func setBordered(color: UIColor, width: CGFloat? = 6, cornerRadius: CGFloat? = 14.0) {
        self.layer.borderWidth = width!
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius!
    }
    
    func setBordered(colors: [UIColor], width: CGFloat? = 6, startPoint: DirectionPoint? = .left, endPoint: DirectionPoint? = .right, cornerRadius: CGFloat? = 14.0) {
        
        let gradient = self.getGradientLayer(colors: colors, startPoint: startPoint!, endPoint: endPoint!, bounds: self.bounds)

        let shape = CAShapeLayer()
        shape.lineWidth = width! * 2
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius!).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        gradient.mask = shape

        self.layer.insertSublayer(gradient, at: 0)
        self.layer.cornerRadius = cornerRadius!
        self.clipsToBounds = true
    }
    
    func makeShadow(color: UIColor? = .primaryBackground, radius: CGFloat? = 6, opacity: Float? = 1, offset: CGSize? = CGSize(width: 6.0, height: 6.0), path: CGPath? = nil) {
        
        self.layer.shadowColor = color!.cgColor
        self.layer.shadowRadius = radius!
        self.layer.shadowOpacity = opacity!
        self.layer.shadowOffset = offset!
        if let _path = path {
            self.layer.shadowPath = _path
        }
    }
    
    private func getGradientLayer(colors: [UIColor], startPoint: DirectionPoint? = .left, endPoint: DirectionPoint? = .right, bounds: CGRect) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors.toCGColors
        gradient.startPoint = startPoint!.rawValue
        gradient.endPoint = endPoint!.rawValue
        
        return gradient
    }
    
    private func makeInsetsProgress() {
        
        let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        if self.isTitleExist && self.isImageExist {
            self.setPadding(10)
        }
    }
    
}

// Extension override
extension MasterButton {
    
    enum ButtonState {
        case normal
        case selected
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.backgroundNormal?.isHidden = (self.backgroundSelected == nil) ? false : true
            self.backgroundSelected?.isHidden = false
            self.backgroundGradientNormal?.isHidden = (self.backgroundGradientSelected == nil) ? false : true
            self.backgroundGradientSelected?.isHidden = false
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            self.alpha = 0.8
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.backgroundNormal?.isHidden = false
            self.backgroundSelected?.isHidden = (self.backgroundNormal == nil) ? true : false
            self.backgroundGradientNormal?.isHidden = false
            self.backgroundGradientSelected?.isHidden = (self.backgroundGradientNormal == nil) ? true : false
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.alpha = 1
        }
    }
    
}
