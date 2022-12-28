//
//  DashboardViewController.swift
//  Mova
//
//  Created by HauNguyen on 26/12/2565 BE.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private let numberOfPages = 4
    
    private let firstView: DashboardFirstView = {
        let view = DashboardFirstView()
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFirstStartView()
        self.setupIntroPageView()
        // Do any additional setup after loading the view.
    }
    
    private func setupFirstStartView() {
        self.view.addSubview(self.firstView)
    }
    
    private func setupIntroPageView() {
        
    }

}

import SwiftUI

struct DashboardViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: DashboardViewController())
    }
}

