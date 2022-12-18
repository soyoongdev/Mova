//
//  RoundedButton.swift
//  Mova
//
//  Created by HauNguyen on 12/12/2565 BE.
//

import UIKit
import SwiftUI

class RoundedButton: UIButton {
    
    var gradientBackgroundLayer : CAGradientLayer?
    var selectedLayer : CALayer?
    
    var insideColor: UIColor = UIColor.green
    var outsideColor: UIColor = UIColor.white
    var gradientLocation: NSNumber = 0.9
    let kAnimationLength:CGFloat = 0.15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = nil
        self.clipsToBounds = true
        self.setTitleColor(UIColor.white, for: .normal)
        
        let colors : [CGColor] = [insideColor.cgColor, outsideColor.cgColor]
        let locations : [NSNumber] = [0,1]
        
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = colors
        layer.locations = locations
        
        self.gradientBackgroundLayer = layer
        
        let selectedLayer : CALayer = CALayer()
        selectedLayer.frame = self.bounds
        selectedLayer.backgroundColor = UIColor.lightGray.cgColor
        self.selectedLayer = selectedLayer
    }
    
    func performLayout() {
        self.gradientBackgroundLayer?.frame = self.bounds
        self.selectedLayer?.frame = self.bounds
        
        self.layer.insertSublayer(self.gradientBackgroundLayer!, at: 0)
        self.layer.insertSublayer(self.selectedLayer!, below: self.gradientBackgroundLayer!)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        performLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: TimeInterval(0.1), delay: 0, options: .curveEaseIn, animations: {
            self.isHighlighted = true
            self.selectedLayer?.isHidden = false
            self.gradientBackgroundLayer?.isHidden = true
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: TimeInterval(0.1), delay: 0, options: .curveEaseOut, animations: {
            self.isHighlighted = false
            self.gradientBackgroundLayer?.isHidden = false
            self.selectedLayer?.isHidden = true
        }, completion: nil)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIView(view: RoundedButton())
    }
}
