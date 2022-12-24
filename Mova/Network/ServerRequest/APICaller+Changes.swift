//
//  APICaller+Changes.swift
//  Mova
//
//  Created by HauNguyen on 24/12/2565 BE.
//

import Foundation

extension APICaller {
    
    func getChanges(type: ListType, page: Int? = 1, startDate: String? = Date().now(), endDate: String? = Date().now(), completion: @escaping (PagedResults<[Movie]>) -> Void) {

        var parameters: [String: AnyObject] = [:]

        if page != nil {
            parameters["page"] = page as AnyObject?
        }

        if startDate != nil {
            parameters["start_date"] = startDate as AnyObject?
        }

        if endDate != nil {
            parameters["end_date"] = endDate as AnyObject?
        }

        let url = appConfig.hostUrl + type.rawValue + "/changes"
        appService.requestAPI(url: url, method: .get, objectType: PagedResults<[Movie]>.self) { (isSuccess, data, statusCode)  in
            completion(data as! PagedResults<[Movie]>)
        }
    }
    
}
