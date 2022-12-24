//
//  AppManager.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit
import SystemConfiguration
/**
 The goal is to create this class to use for user data management (e.g. CoreData, etc.),
 scene management (e.g. fetching the scroll scene position where the user leaves the app), v.v..
 */
public class AppManager: NSObject {
    
    static let shared: AppManager = AppManager()
    
    var isDarkMode: Bool {
        get {
            return _isDarkMode
        }
    }
    
    private var _isDarkMode: Bool = false
    
    func setDarkLightMode(style: UIUserInterfaceStyle) {
        if style == .dark {
            self._isDarkMode = true
        } else {
            self._isDarkMode = false
        }
    }
    
    func checkConnectionActivity() {
        
    }
    
    var isNetworkConnected: Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
}


extension AppManager {
    
    
    
}
