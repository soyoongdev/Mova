//
//  HomeViewHeader.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import UIKit
import SwiftUI

class HomeViewHeader: MasterView {
    
    private let containerView = UIView()

    public var stretchyHeader: StretchyTableHeaderView = {
        let header = StretchyTableHeaderView()
        //header.imageView.image = UIImage(named: "doctor_strange2")
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
        button.setIcon(UIImage(named: "add"), color: .white, size: 14, for: .normal)
        return button
    }()
    
    private let largeTitle: MasterLabel = {
        let title = MasterLabel()
        title.text = "Dr.Strange 2"
        title.font = .bold(size: .large26)
        title.textColor = .textColor
        return title
    }()
    
    private let subTitle: MasterLabel = {
        let title = MasterLabel()
        title.text = "Action, Superhero, Science Fiction."
        title.font = .medium(size: .small)
        title.textColor = .white
        return title
    }()
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(self.stretchyHeader)
        self.addSubview(self.containerView)
        
        let views = [self.largeTitle, subTitle, buttonPlay, buttonList]
        views.forEach { view in
            self.containerView.insertSubview(view, at: views.firstIndex(of: view)!)
        }
    }
    
    override func setupLayoutSubviews() {
        super.setupLayoutSubviews()
        self.stretchyHeader.fillSuperview()
        
        self.containerView.anchor(
            top: nil,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 20, bottom: -20, right: 0)
        )
        
        self.largeTitle.anchor(
            top: self.containerView.topAnchor,
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
            size: CGSize(width: 0, height: 24)
        )
        
        self.buttonPlay.anchor(
            top: self.subTitle.bottomAnchor,
            leading: self.containerView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            size: CGSize(width: 78, height: 30)
        )
        self.buttonPlay.layer.cornerRadius = self.buttonPlay.bounds.size.height/2
        
        self.buttonList.anchor(
            top: self.subTitle.bottomAnchor,
            leading: self.buttonPlay.trailingAnchor,
            bottom: nil,
            trailing: nil,
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
