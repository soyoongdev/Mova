//
//  DashboardSecondView.swift
//  Mova
//
//  Created by HauNguyen on 27/12/2565 BE.
//

import UIKit
import CHIPageControl

class DashboardSecondView: UIView {
    
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
        
    }
    
    private func setupLayouts() {
        
    }

}

import SwiftUI

struct DashboardSecondView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIView(view: DashboardSecondView())
    }
}

