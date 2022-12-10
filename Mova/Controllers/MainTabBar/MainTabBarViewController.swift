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
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = .clear
        // Make background blur view
        
        self.tabBar.insertSubview(UIView.blurView(frame: self.tabBar.bounds), at: 0)
    }
    
    private func setupView() {
        
        let homeVC = self.createNavigation(
            HomeViewController(),
            "home",
            "home-fill",
            MainTabBar.home.rawValue, 0
        )
        
        let exploreVC = self.createNavigation(
            ExploreViewController(),
            "compass",
            "compass-fill",
            MainTabBar.explore.rawValue, 1
        )
        
        let myListVC = self.createNavigation(
            MyListViewController(),
            "bookmark",
            "bookmark-fill",
            MainTabBar.mylist.rawValue, 2
        )
        
        let downloadVC = self.createNavigation(
            DownloadViewController(),
            "download",
            "download-fill",
            MainTabBar.download.rawValue, 3
        )
        
        let profileVC = self.createNavigation(
            ProfileViewController(),
            "user",
            "user-fill",
            MainTabBar.profile.rawValue, 4
        )
        
        self.setViewControllers([homeVC, exploreVC, myListVC, downloadVC, profileVC], animated: true)
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
        
        tabBarItem.image = UIImage(named: iconNameUnSelected)?.resize(width: 22)
        tabBarItem.selectedImage = UIImage(named: iconNameSelected)?.resize(width: 22)
        tabBarItem.title = title
        return tabBarItem
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(tabBarController.selectedIndex)")
    }
    
}

