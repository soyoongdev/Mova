//
//  TextableDivider.swift
//  Mova
//
//  Created by HauNguyen on 02/01/2566 BE.
//

import UIKit

class TextableDivider: UIView {
    
    private let containerView = UIView()
    
    public var dividerView: UIView?
    
    public var titleLabel: MasterLabel = {
        let title = MasterLabel()
        title.font = .semiBold(size: .appResource.primaryTextSizePopular)
        title.textColor = .appResource.textColor
        title.numberOfLines = 1
        title.textAlignment = .center
        let size: CGFloat = 20
        title.setPadding(UIEdgeInsets(top: 0, left: size, bottom: 0, right: size))
        title.backgroundColor = .appResource.primaryBackground
        return title
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
        self.setupSubviewLayouts()
    }

    func setupViews() {
        self.addSubview(self.containerView)
        
        self.dividerView = UIView()
        self.dividerView?.backgroundColor = .appResource.primaryGreyDark
        
        self.containerView.insertSubview(self.dividerView!, at: 0)
        self.containerView.insertSubview(self.titleLabel, at: 1)
        
    }
    
    func setupSubviewLayouts() {
        self.containerView.fillSuperview()
        
        self.dividerView?.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: self.containerView.trailingAnchor,
            size: CGSize(width: 0, height: 1.5)
        )
        self.dividerView?.centerYSuperview(self.containerView)
        
        self.titleLabel.centerAllSuperview(self.containerView)
    }

}
