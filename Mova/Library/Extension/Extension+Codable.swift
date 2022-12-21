//
//  Extension+Codable.swift
//  Mova
//
//  Created by HauNguyen on 20/12/2565 BE.
//

import Foundation

extension Encodable {
    
    func toData() -> Data {
        do {
            let jsonData = try JSONEncoder().encode(self)
            return jsonData
        }
        catch let jsonError {
            print("Erorr toJsonString at: >>> \(jsonError.localizedDescription)")
            return Data()
        }
    }
    
    func toJsonString() -> String? {
        do {
            //            let jsonData = try JSONEncoder().encode(self)
            if let prettyJsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
                if let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) {
                    return prettyPrintedJson
                } else {
                    print("Error: Could print JSON in String")
                    throw RequestAPIWithError.FailedToConvertData
                }
            } else {
                print("Error: Cannot convert JSON object to Pretty JSON data")
                throw RequestAPIWithError.FailedToConvertData
            }
        }
        catch let jsonError {
            print("Erorr toJsonString at: >>> \(jsonError.localizedDescription)")
            return nil
        }
    }
    
}
