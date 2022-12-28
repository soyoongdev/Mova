//
//  DashboardSecondView.swift
//  Mova
//
//  Created by HauNguyen on 27/12/2565 BE.
//

import UIKit
import CHIPageControl

class DashboardSecondView: UIView {
    
    private let pageControl: CHIPageControlAleppo = {
        let _pageControl = CHIPageControlAleppo(frame: .init(origin: .zero, size: .init(width: 100, height: 50)))
        _pageControl.numberOfPages = 3
        _pageControl.radius = 4
        _pageControl.tintColor = .red
        _pageControl.currentPageTintColor = .green
        _pageControl.padding = 6
        return _pageControl
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
        self.pageControl.enableTouchEvents = true
        
        self.addSubview(self.pageControl)
        //update dynamically
        
        self.setupLayouts()
    }
    
    private func setupLayouts() {
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.pageControl.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.pageControl.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }

}

import SwiftUI

struct DashboardSecondView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIView(view: DashboardSecondView())
    }
}

