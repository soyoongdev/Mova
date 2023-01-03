//
//  HomeViewHeader.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import UIKit
import SwiftUI

class HomeViewHeader: UIView {

    public var stretchyHeader: StretchyHeaderImageView = {
        let header = StretchyHeaderImageView()
        header.imageView.image = UIImage(named: "doctor_strange2")
        return header
    }()
    
    private let buttonPlay: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle(text: "Play", for: .normal)
        button.setIcon(UIImage(named: "play-fill"), for: .normal)
        return button
    }()
    
    private let buttonList: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle(text: "My List", for: .normal)
        button.setIcon(UIImage(named: "add"), for: .normal)
        return button
    }()
    
    private let largeTitle: UILabel = {
        let title = UILabel()
        
        title.text = "Dr.Strange 2"
        title.font = .bold(size: .extra34)
        title.textColor = .textColor
        
        return title
    }()
    
    private let subTitle: UILabel = {
        let title = UILabel()
        
        title.text = "Action, Superhero, Science Fiction."
        title.font = .medium(size: .small)
        title.textColor = .white.withAlphaComponent(0.8)
        
        return title
    }()
    
    private let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
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
    
    private func setupViews() {
        self.addSubview(self.stretchyHeader)
        
        self.addSubview(self.vStack)
        self.addSubview(self.hStack)
        
        self.hStack.addArrangedSubview(self.buttonPlay)
        self.hStack.addArrangedSubview(self.buttonList)
        
        self.vStack.addArrangedSubview(self.largeTitle)
        self.vStack.addArrangedSubview(self.subTitle)
        self.vStack.addArrangedSubview(self.hStack)
        
        self.setupLayouts()
    }
    
    private func setupLayouts() {
        self.stretchyHeader.setupLayoutConstraint(self)
        
        self.vStack.translatesAutoresizingMaskIntoConstraints = false
        self.vStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        self.vStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        self.vStack.spacing = 10
        self.vStack.setCustomSpacing(12, after: self.largeTitle)
        self.hStack.spacing = 10
    }

}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
