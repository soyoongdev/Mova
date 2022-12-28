//
//  OnBoardingViewController.swift
//  Mova
//
//  Created by HauNguyen on 28/12/2565 BE.
//

import UIKit

class OnBoardingViewController: UIViewController, OnBoardingPageStackDelegate {
    
    private let walkthroughs = [
        MovaIntroModel(id: 0, imageUrl: "https://wallpapers.com/images/file/sage-naruto-cell-phone-art-gbjepana241apniy-gbjepana241apniy.jpg", title: "Quick Overview", subTitle: "Quickly visualize important business metrics. The overview in the home tab shows the most important metrics to monitor how your business is doing in real time."),
        MovaIntroModel(id: 1, imageUrl: "https://wallpapers.com/images/file/sage-naruto-cell-phone-art-gbjepana241apniy-gbjepana241apniy.jpg", title: "Analytics", subTitle: "Dive deep into charts to extract valuable insights and come up with data driven product initiatives, to boost the success of your business."),
        MovaIntroModel(id: 2, imageUrl: "https://wallpapers.com/images/file/sage-naruto-cell-phone-art-gbjepana241apniy-gbjepana241apniy.jpg", title: "Dashboard Feeds", subTitle: "View your sales feed, orders, customers, products and employees."),
        MovaIntroModel(id: 3, imageUrl: "https://wallpapers.com/images/file/sage-naruto-cell-phone-art-gbjepana241apniy-gbjepana241apniy.jpg", title: "Get Notified", subTitle: "Receive notifications when critical situations occur to stay on top of everything important."),
      ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    private func setupViews() {
        let onBoardingPage = self.getOnBoardingPageStackViewController()
        onBoardingPage.delegate = self
        self.addChildViewControllerWithView(onBoardingPage)
        self.view.bringSubviewToFront(onBoardingPage.view)
    }
    
    func onPageStackDidFinishFlowLayout(_ viewController: OnBoardingPageControlViewController) {
        viewController.view.removeFromSuperview()
        UIView.transition(with: self.view, duration: 1, options: .transitionCrossDissolve) {
            let viewControllerToBePresent = UIViewController()
            self.view.addSubview(viewControllerToBePresent.view)
        }
    }
    
    fileprivate func getOnBoardingPageStackViewController() -> OnBoardingPageControlViewController {
        let viewControllers = self.walkthroughs.map { OnBoardingPageViewController(data: $0) }
        return OnBoardingPageControlViewController(viewControllers: viewControllers)
    }
    
}
