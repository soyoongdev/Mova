//
//  StretchyTableViewHeader.swift
//  Mova
//
//  Created by HauNguyen on 10/12/2565 BE.
//

import UIKit

class StretchyTableViewHeader: MasterView {
    
    public let imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var imageViewHeight = NSLayoutConstraint()
    
    private lazy var imageViewBottom = NSLayoutConstraint()
    
    private lazy var containerView = UIView()
    
    private lazy var containerViewHeight = NSLayoutConstraint()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension StretchyTableViewHeader {
    
    private func setupViews() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.imageView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.containerView.widthAnchor),
            self.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            self.heightAnchor.constraint(equalTo: self.containerView.heightAnchor),
        ])
        
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.widthAnchor.constraint(equalTo: self.imageView.widthAnchor).isActive = true
        self.containerViewHeight = self.containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        self.containerViewHeight.isActive = true
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageViewBottom = self.imageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor)
        self.imageViewBottom.isActive = true
        self.imageViewHeight = self.imageView.heightAnchor.constraint(equalTo: self.containerView.heightAnchor)
        self.imageViewHeight.isActive = true
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        self.containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        self.containerView.clipsToBounds = offsetY <= 0
        self.imageViewBottom.constant = offsetY > 0 ? 0 : (-offsetY / 2)
        self.imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
    
}
