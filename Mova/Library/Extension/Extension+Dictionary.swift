//
//  Extension+Dictionary.swift
//  Mova
//
//  Created by HauNguyen on 20/12/2565 BE.
//

import Foundation

extension Dictionary {
    
    func toCodableObject<T : Codable>() -> T? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let obj = try? decoder.decode(T.self, from: jsonData) {
                return obj
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
}
