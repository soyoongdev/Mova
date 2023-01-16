//
//  OnBoardingPageViewController.swift
//  Mova
//
//  Created by HauNguyen on 28/12/2565 BE.
//

import UIKit
import NukeUI

class OnBoardingPageViewController: UIViewController {
    
    // MARK: - Initilize variables
    
    var model: MovaIntroModel
    
    private let vStack: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        return _self
    }()
    
    private let containerView: UIView = UIView()
    
    private let imageView: LazyImageView = {
        let _self = LazyImageView()
        _self.placeholderView = UIActivityIndicatorView()
        return _self
    }()
    
    private let titleLabel: UILabel = {
        let _self = UILabel()
        _self.font = .bold(size: .appResource.primaryTextSizeLarge32)
        _self.textColor = .appResource.textColor
        _self.numberOfLines = 1
        return _self
    }()
    
    private let subTitle: UILabel = {
        let _self = UILabel()
        _self.font = .medium(size: .appResource.primaryTextSizeSmall)
        _self.textColor = .appResource.textColor
        _self.numberOfLines = 2
        _self.textAlignment = .center
        return _self
    }()
    
    // MARK: - Override init
    
    init(model: MovaIntroModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
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
        self.containerView.addSubview(self.imageView)
        self.containerView.addSubview(self.vStack)
        
        self.imageView.source = ImageRequest(url: URL(string: self.model.imageUrl))
        
        // Add subview VStack
        self.vStack.addArrangedSubview(self.titleLabel)
        self.vStack.addArrangedSubview(self.subTitle)
                
        self.titleLabel.text = self.model.title
        self.subTitle.attributedText = NSAttributedString(string: self.model.subTitle)
        
        self.containerView.bringSubviewToFront(self.vStack)
    }
    
    private func setupLayouts() {
        // Setup anchor containerView
        self.containerView.fillSuperview()
        
        // Setup anchor imageView
        self.imageView.fillSuperview(self.containerView)
        
        // Setup anchor vStack
        self.vStack.spacing = 20
        self.vStack.translatesAutoresizingMaskIntoConstraints = false
        self.vStack.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 20).isActive = true
        self.vStack.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        self.vStack.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -CGFloat(120).relativeToIphone8Height()).isActive = true
    }
    
}

import SwiftUI

struct OnBoardingPageView_Previews: PreviewProvider {
    static var previews: some View {
//        PreviewUIViewController(viewController: OnBoardingPageViewController(model: MovaIntroModel(id: 0, imageUrl: "https://wallpapers.com/images/file/sage-naruto-cell-phone-art-gbjepana241apniy-gbjepana241apniy.jpg", title: "Welcome to Mova", subTitle: "The best movie streaming app of the century to make your days great!")))
        PreviewUIViewController(viewController: OnBoardingSecondViewController())
    }
}

