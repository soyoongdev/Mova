//
//  ViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit

class MainTabBarViewController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.configTabBar()
        self.setupView()
    }
    
    private func configTabBar() {
        self.tabBar.tintColor = .red // Selected item color
        self.tabBar.unselectedItemTintColor = .systemGray // Un selected item color
        
        // Make background blur view
        let effectView = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        effectView.effect = blurEffect
        effectView.frame = self.tabBar.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.tabBar.insertSubview(effectView, at: 0)
    }
    
    private func setupView() {
        
        let homeVC = self.createNavigation(
            HomeViewController(),
            "house",
            "house.fill",
            MainTabBar.home.rawValue, 0
        )
        
        
        let searchVC = self.createNavigation(
            SearchViewController(),
            "magnifyingglass",
            "magnifyingglass",
            MainTabBar.search.rawValue, 1
        )
        
        let upCommingVC = self.createNavigation(
            UpcommingViewController(),
            "play.rectangle.on.rectangle",
            "play.rectangle.on.rectangle.fill",
            MainTabBar.upcomming.rawValue, 2
        )
        
        let downloadVC = self.createNavigation(
            DownloadViewController(),
            "icloud.and.arrow.down",
            "icloud.and.arrow.down.fill",
            MainTabBar.download.rawValue, 3
        )
        
        let moreVC = self.createNavigation(
            MoreViewController(),
            "line.3.horizontal",
            "line.3.horizontal",
            MainTabBar.more.rawValue, 4
        )
        
        self.setViewControllers([homeVC, searchVC, upCommingVC, downloadVC, moreVC], animated: true)
        self.selectedIndex = 0
        self.selectedViewController = homeVC
        
    }
    

    private func createNavigation(_ viewController: UIViewController,
                                  _ iconNameUnSelected: String,
                                  _ iconNameSelected: String,
                                  _ title: String,
                                  _ tag: Int) -> UINavigationController {
        let vc = UINavigationController(rootViewController: viewController)
        
        vc.tabBarItem = self.tabItem(iconNameUnSelected, iconNameSelected, title)
        vc.tabBarItem.tag = tag
        
        return vc
    }
    
    private func tabItem(_ iconNameUnSelected: String,
                         _ iconNameSelected: String,
                         _ title: String) -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        
        tabBarItem.image = UIImage(systemName: iconNameUnSelected)
        tabBarItem.selectedImage = UIImage(systemName: iconNameSelected)
        tabBarItem.title = title
        
        return tabBarItem
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(tabBarController.selectedIndex)")
    }
    
}

