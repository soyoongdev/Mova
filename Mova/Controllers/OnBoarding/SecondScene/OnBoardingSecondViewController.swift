//
//  OnBoardingViewController.swift
//  Mova
//
//  Created by HauNguyen on 28/12/2565 BE.
//

import UIKit
import CHIPageControl

class OnBoardingSecondViewController: UIPageViewController {
    
    private var viewPages = [UIViewController]()
        
    private let viewModel = OnBoardingViewModel()
    
    private let vStack: UIStackView = {
        let _self = UIStackView()
        _self.axis = .vertical
        _self.alignment = .center
        return _self
    }()
    
    /// UIPageControl
    private let pageController: CHIPageControlJaloro = {
        let _self = CHIPageControlJaloro(frame: .zero)
        _self.padding = 6
        _self.radius = 4
        _self.tintColor = .appResource.primaryBackgroundLight
        _self.currentPageTintColor = .appResource.primaryRed
        return _self
    }()
    
    /// Button get started to skip onboarding
    private let buttonGetStarted: PrimaryButton = {
        let button = PrimaryButton(frame: CGRect(origin: .zero, size: CGSize(relative: 350, relative: 52)))
        button.setTitle(text: "Get Started", for: .normal)
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
        
        self.pageController.numberOfPages = self.viewPages.count
        self.setViewControllers([self.viewPages[0]], direction: .forward, animated: true)
    }
    
    private func setupLayouts() {
        
        self.vStack.spacing = 20.0
        self.vStack.translatesAutoresizingMaskIntoConstraints = false
        self.vStack.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.vStack.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        self.vStack.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        self.buttonGetStarted.anchor(top: nil, leading: self.vStack.leadingAnchor, bottom: nil, trailing: self.vStack.trailingAnchor)
        self.buttonGetStarted.addTarget(self, action: #selector(getStartedAction(_:)), for: .touchUpInside)
        
        self.pageController.anchor(top: nil, leading: self.vStack.leadingAnchor, bottom: nil, trailing: self.vStack.trailingAnchor)
    }
    
    @objc private func getStartedAction(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.navigationController?.pushViewController(AuthenticationSelectionViewController(), animated: true)
        }
    }
    
}

extension OnBoardingSecondViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = self.viewPages.firstIndex(of: viewControllers[0]) else { return }
        self.pageController.set(progress: currentIndex, animated: true)
    }
    
}

extension OnBoardingSecondViewController: UIPageViewControllerDataSource {
    
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
        PreviewUIViewController(viewController: OnBoardingSecondViewController())
    }
}

