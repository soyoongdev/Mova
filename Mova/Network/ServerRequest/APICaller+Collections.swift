//
//  APICaller+Collections.swift
//  Mova
//
//  Created by HauNguyen on 24/12/2565 BE.
//

import Foundation

extension APICaller {
    
    func getCollectionDetails(collectionId: Int64!, language: Language? = .en, completion: @escaping (ClientReturn) -> Void) {
        var parameters: [String: AnyObject] = [:]
        
        if language != nil {
            parameters["language"] = language?.rawValue as AnyObject?
        }

        let url = appConfig.hostUrl + "collection/" + collectionId.description
        appService.requestAPI(url: url, method: .get, parameters: parameters, objectType: Translation.self) { isSuccess, data, statusCode in
            
        }
    }
    
    func getCollectionImages(collectionId: Int64!, language: Language? = .en, completion: @escaping (ClientReturn) -> Void) {
        var parameters: [String: AnyObject] = [:]
        
        if language != nil {
            parameters["language"] = language?.rawValue as AnyObject?
        }

        let url = appConfig.hostUrl + "collection/" + collectionId.description + "/images"
        appService.requestAPI(url: url, method: .get, parameters: parameters, objectType: Translation.self) { isSuccess, data, statusCode in
            
        }
    }
    
    func getCollectionTranslations(collectionId: Int64!, language: Language? = .en, completion: @escaping (ClientReturn) -> Void) {
        var parameters: [String: AnyObject] = [:]
        
        if language != nil {
            parameters["language"] = language?.rawValue as AnyObject?
        }

        let url = appConfig.hostUrl + "collection/" + collectionId.description + "/translations"
        appService.requestAPI(url: url, method: .get, parameters: parameters, objectType: Translation.self) { isSuccess, data, statusCode in
            
        }
    }
    
}
