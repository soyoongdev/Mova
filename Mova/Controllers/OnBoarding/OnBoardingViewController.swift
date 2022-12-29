//
//  OnBoardingViewController.swift
//  Mova
//
//  Created by HauNguyen on 28/12/2565 BE.
//

import UIKit

class OnBoardingViewController: UIPageViewController {
    
    private var viewPages = [UIViewController]()
    
    private let pageIndex: Int = 0
    
    private let viewModel = OnBoardingViewModel()
    
    private let vStack: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        return _self
    }()
    
    /// UIPageControl
    private let pageController: UIPageControl = {
        let _pageController = UIPageControl(frame: .init(origin: .zero, size: .init(width: 100, height: 50)))
        //        _pageControl.numberOfPages = 3
        //        _pageControl.radius = 4
        _pageController.tintColor = .red
        //        _pageControl.currentPageTintColor = .green
        //        _pageControl.padding = 6
        return _pageController
    }()
    
    /// Button get started to skip onboarding
    private let buttonGetStarted: PrimaryButtonMedium = {
        let button = PrimaryButtonMedium()
        button.setTitle(title: "Get Started")
        button.setBackground(color: .primaryRed, for: .normal)
        return button
    }()
        
    // MARK: - Override
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupLayouts()
    }
    
    private func setupViews() {
        self.delegate = self
        self.dataSource = self
        self.viewModel.models.forEach { model in
            self.viewPages.append(OnBoardingPageViewController(model: model))
        }
        
        self.view.addSubview(self.vStack)
        
        self.vStack.addArrangedSubview(self.pageController)
        self.vStack.addArrangedSubview(self.buttonGetStarted)
        
        self.setViewControllers([self.viewPages[pageIndex]], direction: .forward, animated: true)
    }
    
    private func setupLayouts() {
        
        self.vStack.spacing = 10.0
        self.vStack.translatesAutoresizingMaskIntoConstraints = false
        self.vStack.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.vStack.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        self.vStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -CGFloat(20).relativeToIphone8Height()).isActive = true
        
        self.buttonGetStarted.translatesAutoresizingMaskIntoConstraints = false
        self.buttonGetStarted.leftAnchor.constraint(equalTo: self.vStack.leftAnchor).isActive = true
        self.buttonGetStarted.rightAnchor.constraint(equalTo: self.vStack.rightAnchor).isActive = true
        self.buttonGetStarted.addTarget(self, action: #selector(getStartedAction(_:)), for: .touchUpInside)
    }
    
    @objc private func getStartedAction(_ sender: Any) {
        print("\(self.viewPages.count)")
    }
    
}

extension OnBoardingViewController: UIPageViewControllerDelegate {
    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//    }
    
}

extension OnBoardingViewController: UIPageViewControllerDataSource {
    
    // Before viewcontroller will display
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = self.viewPages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            // Move to last
            return self.viewPages.last
        } else {
            return self.viewPages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = self.viewPages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < (self.viewPages.count - 1) {
            // Move to last
            return self.viewPages[currentIndex + 1]
        } else {
            return self.viewPages.first
        }
    }
    
    
}



import SwiftUI

struct OnBoardingViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: OnBoardingViewController())
    }
}

