//
//  Enums.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit

enum MainTabBar: String {
    case home = "Home"
    case explore = "Explore"
    case mylist = "My List"
    case download = "Download"
    case profile = "Profile"
}

enum DirectionPoint {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case left
    case right
    case top
    case bottom
    case zero
}

enum ActiveState {
    case active
    case deactive
}

extension DirectionPoint: RawRepresentable {
    typealias RawValue = CGPoint

    init?(rawValue: CGPoint) {
        if rawValue == CGPoint.zero {
            self = .zero
        } else {
            return nil
        }
    }

    var rawValue: CGPoint {
        switch self {
        case .zero:
            return CGPoint.zero
        case .topLeft:
            return CGPoint(x: 0.0, y: 0.0)
        case .topRight:
            return CGPoint(x: 1.0, y: 0.0)
        case .bottomLeft:
            return CGPoint(x: 0.0, y: 1.0)
        case .bottomRight:
            return CGPoint(x: 1.0, y: 1.0)
        case .left:
            return CGPoint(x: 0.0, y: 0.5)
        case .right:
            return CGPoint(x: 1.0, y: 0.5)
        case .top:
            return CGPoint(x: 0.5, y: 0.0)
        case .bottom:
            return CGPoint(x: 0.5, y: 1)
        }
    }
}


/// Enum error call API
enum RequestAPIWithError: String, Error {
    case FailedTogetData = "Failed to get data."
    case NoInternetConnection = "Internet connection not available."
    case FailedToConvertData = "Failed to convert data model."
}
