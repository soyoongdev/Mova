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
    func requestAPI<T : Codable>(url: String, method: HTTPMethod, parameters: [String:Any]? = [:], headers: HTTPHeaders? = nil, objectType: T.Type,_ completion: @escaping CompletionHandleJSONCode) {
        var params = parameters
        params?["api_key"] = AppConfig.shared.apiKey as String
        /// Check internet connection
        if AppManager.shared.isNetworkConnected {
            /// Connection network is successfully!
            let sessionManager = Alamofire.Session.default
            let request = sessionManager.request(url, method: method, parameters: params, headers: headers)
            request.responseData { (response) in
                
                switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String:Any] else {
                            completion(false, nil, response.response?.statusCode)
                            print("Service Error 1: Cannot convert data to JSON object")
                            return
                        }
                        
                        if let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) {
                            if let obj = try? JSONDecoder().decode(objectType, from: prettyJsonData) {
                                completion(true, obj, response.response?.statusCode)
                            } else {
                                completion(false, nil, response.response?.statusCode)
                                print("Service Error 3: Cannot convert data to JSON object")
                                return
                            }
                        } else {
                            completion(false, nil, response.response?.statusCode)
                            print("Service Error 2: Cannot convert data to JSON object")
                            return
                        }
                    } catch {
                        completion(false, nil, response.response?.statusCode)
                        print("Service Error 4: Trying to convert JSON data to string.")
                        return
                    }
                case .failure(let error):
                    print("Service Error 6: \(error.errorDescription ?? "")")
                    completion(false, nil, response.response?.statusCode)
                    return

                }
            }
        }
        else {
            /// Connection network is failed!
            print("No internet connection!!!")
        }
        
    }
}
