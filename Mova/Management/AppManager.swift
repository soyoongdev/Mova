//
//  AppManager.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

/**
 The goal is to create this class to use for user data management (e.g. CoreData, etc.),
 scene management (e.g. fetching the scroll scene position where the user leaves the app), v.v..
 */
public class AppManager: NSObject {
    
    
    
}


extension AppManager {
    
    class var shared: AppManager {
        get {
            return AppManager()
        }
    }
    
}
