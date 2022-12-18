//
//  FeedNewBannerHeader.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

@available(iOS 13.0, *)
class FeedNewBannerHeader: MasterView {
    
    private var darkMode: Bool = false
    
    var buttonChangeMode: UIButton = {
        var button = UIButton(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 80, height: 40)))
        
        button.setTitle("Change mode", for: .normal)
        button.sizeToFit()
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .brown
        self.setupView()
    }
    
    private func setupView() {
        self.addSubview(self.buttonChangeMode)
        self.buttonChangeMode.addTarget(self, action: #selector(self.pressed), for: .touchDown)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pressed() {
        self.darkMode.toggle()
        
        print("Changed")
    }

    
}
