//
//  MasterButton.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit

class MasterButton: UIButton {
    
    enum BackgroundType {
        case fill
        case outline
    }
        
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayouts()
    }
    
    weak var delegate: MasterButtonDelegate?
    
    private var backgroundType: BackgroundType = .fill
        
    private var isActive: Bool = false
    
    private var block: (() -> Void)?
    
    private var _axis: NSLayoutConstraint.Axis = .horizontal
    
    private var backgroundNormal: CALayer?
    
    private var backgroundSelected: CALayer?
    
    private var backgroundImageNormal = UIImage()
    
    private var backgroundImageSelected = UIImage()
    
    private var imageiconNormal : UIImage?
    
    private var imageiconSelected : UIImage?
    
    func setupViews() {
        self.backgroundColor = nil
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.contentMode = .scaleAspectFit
        self.delegate?.setupViews()
    }
    
    private func setupLayouts() {
        if isLayerExist(layer: backgroundNormal) {
            self.backgroundNormal?.frame = self.bounds
            self.layer.insertSublayer(self.backgroundNormal!, at: 0)
        }

        if isLayerExist(layer: backgroundSelected) {
            self.backgroundSelected?.frame = self.bounds
            self.layer.insertSublayer(self.backgroundSelected!, at: 0)
        }
    }
    
    var axis: NSLayoutConstraint.Axis {
        get {
            return self._axis
        }
        set {
            _axis = newValue
        }
    }
    
    func setBackgroundType(type: BackgroundType) {
        self.backgroundType = type
        switch type {
        case .outline:
            self.backgroundNormal?.isHidden = true
            self.backgroundSelected?.isHidden = true
            self.layer.borderWidth = 1.5
            self.layer.frame = self.bounds
            self.layer.borderColor = UIColor.textButtonColor?.deactive?.cgColor
        default:
            break;
        }
    }
    
    func setButtonStyle(style: CustomButtonType) {
        var insets = UIEdgeInsets()
        var spacePadding: CGFloat = 0
        var cornerRadius: CGFloat = 0
        
        switch style {
        case .small: // 8
            if self.imageiconNormal != nil || self.imageiconSelected != nil {
                spacePadding = 8
            }
            cornerRadius = 16
            insets = UIEdgeInsets(top: 8, left: 14, bottom: 8, right: 14)
        case .medium: // 10
            if self.imageiconNormal != nil || self.imageiconSelected != nil {
                spacePadding = 10
            }
            cornerRadius = 30
            insets = UIEdgeInsets(top: 20, left: 38, bottom: 20, right: 38)
        default: // 14
            if self.imageiconNormal != nil || self.imageiconSelected != nil {
                spacePadding = 30
            }
            cornerRadius = 16
            insets = UIEdgeInsets(top: 14, left: 28, bottom: 14, right: 28)
        }
        
        self.setInsets(forContentPadding: insets, imageTitlePadding: spacePadding)
        self.layer.cornerRadius = cornerRadius
    }
    
    func setTitle(title: String? = "", color: UIColor? = .textButtonColor?.deactive, font: UIFont? = nil) {
        if let _font = font {
            self.titleLabel?.font = _font
        }
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 1
    }

    func setBackground(color: UIColor?, for state: UIControl.State) {
        let layer : CALayer = CALayer()
        layer.frame = self.bounds
        layer.backgroundColor = color?.cgColor
        if state == .normal {
            self.backgroundNormal = layer
        }
        if state == .selected {
            layer.isHidden = true
            self.backgroundSelected = layer
        }
    }

    func setImageIcon(image: UIImage? = nil, color: UIColor? = .textButtonColor?.deactive, size: CGFloat? = .small, for state: UIControl.State) {
        
        var getImage = image?.resize(with: size!)
        getImage = getImage?.withTintColor(color!, renderingMode: .alwaysTemplate)
        if state == .normal {
            self.imageiconNormal = getImage
            self.setImage(getImage, for: .normal)
        }
        if state == .selected {
            self.imageiconSelected = getImage
            self.setImage(getImage, for: .normal)
        }
        self.tintColor = color
    }
    
    func setSelected() {
        
    }
    
    func setDeselected() {
        print("Deselected")
    }
    
    func setAction(action: @escaping () -> Void) {
        self.block = action
        self.addTarget(self, action: #selector(blockAction(_ :)), for: .touchUpInside)
    }
    
    func setContentPositionAttribute(positionAttribute: ContentPositionAttribute) {
        switch positionAttribute {
        case .rightToleft:
            self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        case .bottomToTop: // ???
            self.transform = CGAffineTransform(rotationAngle: -90 * .pi/180)
            self.titleLabel?.transform = CGAffineTransform(rotationAngle: 90 * .pi/180)
            self.imageView?.transform = CGAffineTransform(rotationAngle: 90 * .pi/180)
        case .topToBottom: // ???
            self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        default: // Default left to right
            self.transform = CGAffineTransform(scaleX: 1.0, y: -1.0)
            self.titleLabel?.transform = CGAffineTransform(scaleX: 1.0, y: -1.0)
            self.imageView?.transform = CGAffineTransform(scaleX: 1.0, y: -1.0)
            break;
        }
    }
    
    func setContentAxis(axis: NSLayoutConstraint.Axis) {
        if axis == .vertical {
            self.transform = CGAffineTransform(rotationAngle: -90 * .pi/180)
            self.titleLabel?.transform = CGAffineTransform(rotationAngle: 90 * .pi/180)
            self.imageView?.transform = CGAffineTransform(rotationAngle: 90 * .pi/180)
        } else {
            return // Default is Horizontal
        }
    }
    
    @objc private func blockAction(_ sender: UIButton) {
        self.isActive.toggle()
        
        if self.isActive {
            self.setSelected()
        } else {
            self.setDeselected()
        }
        
        self.block?()
    }
    
}

// Extension override
extension MasterButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.layerBackgroundProgress(normal: self.backgroundNormal, selected: self.backgroundSelected, for: .active)
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            self.alpha = 0.8
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.layerBackgroundProgress(normal: self.backgroundNormal, selected: self.backgroundSelected, for: .deactive)
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.alpha = 1
        }
    }
    
}

// Extension make enum
extension MasterButton {
    
    enum ContentPositionAttribute {
        case rightToleft
        case leftToRight
        case bottomToTop
        case topToBottom
    }
    
    private func isLayerExist(layer: CALayer?) -> Bool {
        if let _ = layer {
            return true
        } else {
            return false
        }
    }
    
    private func layerBackgroundProgress(normal layerNormal: CALayer? = nil, selected layerSelected: CALayer? = nil, for state: ActiveState) {
        if state == .active {
            layerNormal?.isHidden = (layerSelected != nil)
            layerSelected?.isHidden = (layerSelected == nil)
        }
        if state == .deactive {
            layerNormal?.isHidden = false
            layerSelected?.isHidden = true
        }
        
        
    }
    
}
