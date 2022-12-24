//
//  Extension+Data.swift
//  Mova
//
//  Created by HauNguyen on 20/12/2565 BE.
//

import Foundation

extension Data {
    
    func toCodableObject<T : Codable>() -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        if let obj = try? decoder.decode(T.self, from: self) {
            return obj
        } else {
            return nil
        }
    }
    
}
