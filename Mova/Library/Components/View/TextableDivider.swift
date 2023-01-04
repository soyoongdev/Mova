//
//  TextableDivider.swift
//  Mova
//
//  Created by HauNguyen on 02/01/2566 BE.
//

import UIKit

class TextableDivider: UIView {
    
    private let container = UIView()
    
    public var dividerView: UIView?
    
    public var titleLabel: MasterLabel = {
        let title = MasterLabel()
        title.font = .semiBold(size: .small)
        title.textColor = .textColor
        title.numberOfLines = 1
        title.textAlignment = .center
        let size: CGFloat = 20
        title.setPadding(UIEdgeInsets(top: 0, left: size, bottom: 0, right: size))
        title.backgroundColor = .primaryBackground
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
        self.setupLayouts()
    }

    func setupViews() {
        self.addSubview(self.container)
        
        self.dividerView = UIView()
        self.dividerView?.backgroundColor = .primaryBackgroundLight
        
        self.container.insertSubview(self.dividerView!, at: 0)
        self.container.insertSubview(self.titleLabel, at: 1)
        
    }
    
    func setupLayouts() {
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.container.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.container.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.dividerView?.translatesAutoresizingMaskIntoConstraints = false
        self.dividerView?.leftAnchor.constraint(equalTo: self.container.leftAnchor).isActive = true
        self.dividerView?.rightAnchor.constraint(equalTo: self.container.rightAnchor).isActive = true
        self.dividerView?.heightAnchor.constraint(equalToConstant: 2).isActive = true
        self.dividerView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.container.centerYAnchor).isActive = true
    }

}

import SwiftUI

struct TextableDivider_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: AuthenticationSelectionViewController())
    }
}

