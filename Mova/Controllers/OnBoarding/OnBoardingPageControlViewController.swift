//
//  OnBoardingPageStackViewController.swift
//  Mova
//
//  Created by HauNguyen on 28/12/2565 BE.
//

import UIKit
import CHIPageControl

protocol OnBoardingPageStackDelegate: AnyObject {
    func onPageStackDidFinishFlowLayout(_ viewController: OnBoardingPageControlViewController)
}

class OnBoardingPageControlViewController: UIViewController {
    
    // MARK: - Initilize variables
    
    weak var delegate: OnBoardingPageStackDelegate?
    
    private var viewControllers = [UIViewController]()
    
    private var pageIndex: Int = 0
    
    /// UIPageViewController
    private lazy var pageViewController: UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private lazy var fakeVC: UIViewController = UIViewController()
    
    private let containerView = UIView()
    
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        return stack
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
    
    
    // MARK: - Override view
    
    init(viewControllers: [UIViewController]) {
      self.viewControllers = viewControllers
      super.init(nibName: nil, bundle: nil)
      self.pageViewController.dataSource = self
      self.pageViewController.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.setupViews()
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupLayouts()
    }
    
    
    // MARK: - Setup view

    private func setupViews() {
        self.view.addSubview(self.containerView)
        self.view.bringSubviewToFront(self.containerView)
        self.containerView.addSubview(self.vStack)
        self.vStack.addArrangedSubview(self.pageController)
        self.vStack.addArrangedSubview(self.buttonGetStarted)
        
        self.pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
        self.addChildViewControllerWithView(self.pageViewController)
        self.pageController.numberOfPages = self.viewControllers.count
    }
    
    private func setupLayouts() {
        // Setup anchor containerView
        self.containerView.setupLayoutConstraint(self.view)
        
        // Setup anchor StackView
        self.vStack.spacing = 10.0
        self.vStack.translatesAutoresizingMaskIntoConstraints = false
        self.vStack.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 20).isActive = true
        self.vStack.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -20).isActive = true
        self.vStack.bottomAnchor.constraint(equalTo: self.containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        self.buttonGetStarted.translatesAutoresizingMaskIntoConstraints = false
        self.buttonGetStarted.leftAnchor.constraint(equalTo: self.vStack.leftAnchor).isActive = true
        self.buttonGetStarted.rightAnchor.constraint(equalTo: self.vStack.rightAnchor).isActive = true
        
        self.buttonGetStarted.addTarget(self, action: #selector(getStartedButtonHandler), for: .touchUpInside)
    }
    
    @objc private func getStartedButtonHandler() {
        print("Get started")
    }

}

extension OnBoardingPageControlViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let _index = self.index(of: viewController) {
            if _index == 0 {
                return nil
            }
            return self.viewControllers[_index - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let _index = self.index(of: viewController) {
            if _index + 1 >= self.viewControllers.count {
                return self.fakeVC
            }
            return self.viewControllers[_index + 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
          return
        }
        if let lastPushedVC = pageViewController.viewControllers?.last {
            if let _index = self.index(of: lastPushedVC) {
                self.pageController.currentPage = _index
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if pendingViewControllers.first == self.fakeVC {
            self.removeChildViewController(self.pageViewController)
            self.delegate?.onPageStackDidFinishFlowLayout(self)
        }
    }
    
    
    private func index(of viewController: UIViewController) -> Int? {
        for (index, vc) in self.viewControllers.enumerated() {
        if viewController == vc {
          return index
        }
      }
      return nil
    }
    
}

