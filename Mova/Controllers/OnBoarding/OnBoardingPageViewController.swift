//
//  OnBoardingPageViewController.swift
//  Mova
//
//  Created by HauNguyen on 28/12/2565 BE.
//

import UIKit

class OnBoardingPageViewController: UIViewController {
    
    var data: MovaIntroModel
    
    init(data: MovaIntroModel) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let vStack: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        return _self
    }()
    
    private let containerView: UIView = UIView()
    
    private let imageView: UIImageView = {
        let _self = UIImageView()
        _self.contentMode = .scaleAspectFill
        _self.clipsToBounds = true
        return _self
    }()
    
    private let titleLabel: UILabel = {
        let _self = UILabel()
        _self.font = .bold(size: .extra32)
        _self.textColor = .textColor
        _self.numberOfLines = 1
        return _self
    }()
    
    private let subTitle: UILabel = {
        let _self = UILabel()
        _self.font = .medium(size: .medium)
        _self.textColor = .textColor
        _self.numberOfLines = 2
        _self.textAlignment = .center
        return _self
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupLayouts()
    }
    
    private func setupViews() {
        self.view.addSubview(self.containerView)
        self.containerView.insertSubview(self.imageView, at: 0)
        
        
        // Add subview VStack
        self.vStack.addArrangedSubview(self.titleLabel)
        self.vStack.addArrangedSubview(self.subTitle)
        self.containerView.insertSubview(self.vStack, at: 1)
        
        
        self.imageView.loadFromUrl(url: URL(string: self.data.imageUrl)!)
        self.titleLabel.text = self.data.title
        self.subTitle.attributedText = NSAttributedString(string: self.data.subTitle)
    }
    
    private func setupLayouts() {
        // Setup anchor containerView
        self.containerView.setupLayoutConstraint(self.view)
        // Setup anchor vStack
        self.vStack.spacing = 20
        self.vStack.translatesAutoresizingMaskIntoConstraints = false
        self.vStack.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 20).isActive = true
        self.vStack.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        self.vStack.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -CGFloat(135).relativeToIphone8Height()).isActive = true
        // Setup anchor imageView
        self.imageView.setupLayoutConstraint(self.containerView)
    }
    
}

import SwiftUI

struct OnBoardingPageViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: OnBoardingPageViewController(data: MovaIntroModel(id: 0, imageUrl: "https://wallpapers.com/images/file/sage-naruto-cell-phone-art-gbjepana241apniy-gbjepana241apniy.jpg", title: "Welcome to Mova", subTitle: "The best movie streaming app of the century to make your days great!")))
    }
}

