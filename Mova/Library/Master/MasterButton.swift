//
//  MasterButton.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit
import SwiftUI

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
        
    private lazy var isActive: Bool = false
    
    private var block: (() -> Void)?
        
    private lazy var isTouched: Bool = false
    
    private lazy var _axis: NSLayoutConstraint.Axis = .horizontal
    
    private lazy var backgroundGradientNormal: CAGradientLayer = CAGradientLayer()
    
    private lazy var backgroundGradientSelected: CAGradientLayer = CAGradientLayer()
    
    private lazy var backgroundNormal: CALayer = CALayer()
    
    private lazy var backgroundSelected: CALayer = CALayer()
    
    private var backgroundImageNormal = UIImage()
    
    private var backgroundImageSelected = UIImage()
    
    private var imageiconNormal : UIImage? = {
        return UIImage()
    }()
    
    private var imageiconSelected : UIImage? = {
        return UIImage()
    }()
    
    func setupViews() {
        self.delegate?.setupViews()
        self.backgroundColor = nil
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.contentMode = .scaleAspectFit
    }
    
    private func setupLayouts() {
        if isLayerExist(layer: backgroundGradientNormal) {
            self.backgroundGradientNormal.frame = self.bounds
            self.layer.insertSublayer(self.backgroundGradientNormal, at: 1)
        }

        if isLayerExist(layer: backgroundGradientSelected) {
            self.backgroundGradientSelected.frame = self.bounds
            self.layer.insertSublayer(self.backgroundGradientSelected, at: 0)
        }

        if isLayerExist(layer: backgroundNormal) {
            self.backgroundNormal.frame = self.bounds
            self.layer.insertSublayer(self.backgroundNormal, at: 1)
        }

        if isLayerExist(layer: backgroundSelected) {
            self.backgroundSelected.frame = self.bounds
            self.layer.insertSublayer(self.backgroundSelected, at: 0)
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
            self.backgroundNormal.isHidden = true
            self.backgroundSelected.isHidden = true
            self.backgroundGradientNormal.isHidden = true
            self.backgroundGradientSelected.isHidden = true
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
            spacePadding = 8
            cornerRadius = 16
            insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        case .medium: // 10
            spacePadding = 10
            cornerRadius = 27
            insets = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
        default: // 14
            spacePadding = 10
            cornerRadius = 16
            insets = UIEdgeInsets(top: 14, left: 28, bottom: 14, right: 28)
        }
        
        self.setInsets(forContentPadding: insets, imageTitlePadding: spacePadding)
        self.layer.cornerRadius = cornerRadius
    }
    
    func setTitle(_ title: String? = "", color: UIColor? = .textButtonColor?.deactive, fontSize: CGFloat? = .small) {
        self.titleLabel?.font = .regular(size: .small)
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 1
    }

    func setBackgroundGradient(colors: [UIColor], startPoint: DirectionPoint, endPoint: DirectionPoint, for state: UIControl.State) {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = colors.toCGColors
        layer.locations = [0.0, 1.0]
        layer.startPoint = startPoint.rawValue
        layer.endPoint = endPoint.rawValue
        
        if state == .normal {
            self.backgroundGradientNormal = layer
        }
        if state == .selected {
            self.backgroundGradientSelected = layer
        }
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

    func setImageIcon(image: UIImage?, color: UIColor? = .textButtonColor?.deactive, size: CGFloat? = .small, for state: UIControl.State) {
        var getImage = image?.resize(with: size!)
        getImage = getImage?.withTintColor(color!, renderingMode: .alwaysTemplate)
        if state == .normal {
            self.imageiconNormal = getImage
            self.setImage(getImage, for: state)
        } else {
            self.imageiconSelected = getImage
            self.setImage(getImage, for: state)
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
        self.isActive = self.isActive
        
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
        UIView.animate(withDuration: 0.015) {
            self.isTouched = true
            self.layerProgress(normal: self.backgroundGradientNormal, selected: self.backgroundGradientSelected, for: .active)
            self.layerProgress(normal: self.backgroundNormal, selected: self.backgroundSelected, for: .active)
            self.alpha = 0.8
            self.tintColor = .white
        }        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.015) {
            self.isTouched = false
            self.layerProgress(normal: self.backgroundGradientNormal, selected: self.backgroundGradientSelected, for: .deactive)
            self.layerProgress(normal: self.backgroundNormal, selected: self.backgroundSelected, for: .deactive)
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
    
    private func layerProgress(normal layerNormal: CALayer?, selected layerSelected: CALayer?, for state: ActiveState) {
        if state == .active {
            if self.isLayerExist(layer: layerNormal) && self.isLayerExist(layer: layerSelected) {
                layerNormal?.isHidden = true
                layerSelected?.isHidden = false
            }
            else if self.isLayerExist(layer: layerNormal) && self.isLayerExist(layer: layerSelected) {
                layerNormal?.isHidden = true
            }
            else if self.isLayerExist(layer: layerNormal) && self.isLayerExist(layer: layerSelected) {
                layerSelected?.isHidden = false
            }
        } else {
            if self.isLayerExist(layer: layerSelected) && self.isLayerExist(layer: layerSelected) {
                layerNormal?.isHidden = false
                layerSelected?.isHidden = true
            }
            else if self.isLayerExist(layer: layerNormal) && self.isLayerExist(layer: layerSelected) {
                layerNormal?.isHidden = false
            }
            else if self.isLayerExist(layer: layerNormal) && self.isLayerExist(layer: layerSelected) {
                layerSelected?.isHidden = true
            }
        }
    }
    
}

struct MasterButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
