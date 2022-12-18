//
//  BaseViewController.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

public class BaseViewController: UIViewController {
    
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


extension BaseViewController {
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        let appConfig = AppConfig()
        if previousTraitCollection?.userInterfaceStyle == .dark {
            appConfig.setDarkLightMode(style: .dark)
        } else {
            appConfig.setDarkLightMode(style: .light)
        }
    }
    
}
