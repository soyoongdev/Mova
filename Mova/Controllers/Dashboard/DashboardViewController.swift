//
//  DashboardViewController.swift
//  Mova
//
//  Created by HauNguyen on 26/12/2565 BE.
//

import UIKit

class DashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewControllerWithView(OnBoardingFirstViewController())
    }

}
