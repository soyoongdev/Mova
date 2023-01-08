//
//  BaseViewController.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

public class MasterViewController: UIViewController {
    
    // MARK: - Life cycle
    
    /// 0
    /// Called first when initializing a view controller
    /// Eg: initialize the UI
    public override func loadView() {
        super.loadView()
    }
    
    /// 1
    /// When the view controller has been loaded into memory (provided that this view controller does not already exist in memory), the viewDidLoad function is called.
    /// Called only once in the life of that view.
    /// Often used to prepare data or initialize default values for objects and UI on the screen.
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 2
    /// Called before a view is added to the view system and before the animation renders a view.
    /// At the time of animation to display the view, if you want to customize something, this function will help you do it.
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make sure the top constraint of the TableView is equal to Superview and not Safe Area
        
        // Hide the navigation bar completely
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        // Make the Navigation Bar background transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white

        // Remove 'Back' text and Title from Navigation Bar
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = ""
    }
    
    /// 3
    /// The function will be called when a view has been added to several view systems and displayed on the screen.
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /// 4
    /// Called when a view has been hidden from the screen and amination when the view is hidden.
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    /// 5
    /// Called when a view has been hidden from the screen.
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}


extension MasterViewController {
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.userInterfaceStyle == .dark {
            AppManager.shared.setDarkLightMode(style: .dark)
        } else {
            AppManager.shared.setDarkLightMode(style: .light)
        }
    }
    
    func hiddenNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
}
