//
//  StretchyHeaderImageView.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import UIKit
import SwiftUI
    
class StretchyHeaderImageView: MasterView {
    
    public let imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "mountain")
        return image
    }()
    
    private lazy var imageViewHeight = NSLayoutConstraint()
    
    private lazy var imageViewBottom = NSLayoutConstraint()
    
    private lazy var containerView = UIView()
    
    private lazy var containerViewHeight = NSLayoutConstraint()

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
    }
    
    private func setupViews() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.imageView)
        self.setupImageLayouts()
    }
}

// MARK: - Image
extension StretchyHeaderImageView {
    
    private func setupImageLayouts() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.leftAnchor.constraint(equalTo: self.containerView.leftAnchor),
            self.rightAnchor.constraint(equalTo: self.containerView.rightAnchor),
            self.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
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


struct StretchyHeaderImageView_Previews: PreviewProvider {
    static var previews: some View {
        //PreviewUIView(view: StretchyHeaderImageView())
        PreviewUIViewController(viewController: HomeViewController())
    }
}
