//
//  HomeViewHeader.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import UIKit
import SwiftUI

class HomeViewHeader: MasterView {
    
    private var containerView = UIView()

    public var stretchyHeader: StretchyTableHeaderView = {
        let header = StretchyTableHeaderView()
        header.imageView.image = UIImage(named: "doctor_strange2")
        return header
    }()
    
    private let buttonPlay: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle(text: "Play", for: .normal)
        button.setIcon(UIImage(named: "play-fill"), color: .white, size: 14, for: .normal)
        return button
    }()
    
    private let buttonList: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle(text: "My List", for: .normal)
        button.setIcon(UIImage(named: "plus"), color: .white, size: 14, for: .normal)
        return button
    }()
    
    private let largeTitle: MasterLabel = {
        let title = MasterLabel()
        title.text = "Dr.Strange 2"
        title.font = .bold(size: .appResource.primaryTextSizeLarge26)
        title.textColor = .appResource.textColor
        return title
    }()
    
    private let subTitle: MasterLabel = {
        let title = MasterLabel()
        title.text = "Action, Superhero, Science Fiction."
        title.font = .medium(size: .appResource.primaryTextSizeSmall)
        title.textColor = .white
        return title
    }()
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(self.stretchyHeader)
        self.addSubview(self.containerView)
        self.bringSubviewToFront(self.containerView)
        
        let views = [largeTitle, subTitle, buttonPlay, buttonList]
        views.forEach { view in
            self.containerView.insertSubview(view, at: views.firstIndex(of: view)!)
        }
    }
    
    override func setupLayoutSubviews() {
        super.setupLayoutSubviews()
        self.stretchyHeader.fillSuperview()
                
        self.containerView.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 20, bottom: -20, right: 0)
        )
        
        self.largeTitle.anchor(
            top: nil,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            size: CGSize(width: 0, height: 24)
        )
        
        self.subTitle.anchor(
            top: self.largeTitle.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 24)
        )
        
        self.buttonPlay.anchor(
            top: self.subTitle.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: self.containerView.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 78, height: 30)
        )
        self.buttonPlay.layer.cornerRadius = self.buttonPlay.bounds.size.height/2
        
        self.buttonList.anchor(
            top: nil,
            leading: self.buttonPlay.trailingAnchor,
            bottom: self.containerView.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0),
            size: CGSize(width: 95, height: 30)
        )
        self.buttonList.layer.cornerRadius = self.buttonList.bounds.size.height/2
    }

}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
