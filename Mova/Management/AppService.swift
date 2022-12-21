//
//  AppService.swift
//  Mova
//
//  Created by HauNguyen on 19/12/2565 BE.
//

import UIKit
import Alamofire

typealias CompletionHandleJSONCode = (_ isSuccess: Bool,_ data: Any?,_ statusCode: Int?) -> Void

class AppService: NSObject {
    
    static let shared: AppService = AppService()

    /// Request API with parameters
    func requestAPI<T : Codable>(url: String, method: HTTPMethod, parameters: Dictionary<String, Any>? = nil, headers: HTTPHeaders? = nil, objectType: T.Type, encoding: ParameterEncoding,_ completion: @escaping CompletionHandleJSONCode) {
        
        /// Check connection network
        if !AppConfig.shared.isNetworkConnected {
            /// Connection network is successfully!
            let sessionManager = Alamofire.Session.default
            let request = sessionManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            request.responseData { (response) in
                
                switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String:Any] else {
                            completion(false, data, response.response?.statusCode)
                            print("Service Error 1: Cannot convert data to JSON object")
                            return
                        }
                        
                        if let data = jsonObject.toCodableObject() as T? {
                            completion(true, data, response.response?.statusCode)
                        } else {
                            print("Service Error 2: Cannot decode json object as T")
                            completion(false, jsonObject, response.response?.statusCode)
                        }
                    } catch {
                        print("Service Error 3: Trying to convert JSON data to string")
                        return
                    }
                    break
                case .failure(let error):
                    print("Service Error 6: \(error.errorDescription ?? "")")
                    completion(false, nil, response.response?.statusCode)
                    break
                
                }
            }
            
        }
        else {
            /// Connection network is failed!
            print("No internet connection!!!")
        }
        
    }
}
