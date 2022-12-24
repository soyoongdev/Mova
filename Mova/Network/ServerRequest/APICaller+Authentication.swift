//
//  Client_Authentication.swift
//  Mova
//
//  Created by HauNguyen on 21/12/2565 BE.
//

import Foundation

extension APICaller {
        
    func createGuestSession(completion: @escaping (GuestSessionResponse) -> Void) {
        let url = appConfig.hostUrl + "authentication/guest_session/new"
        appService.requestAPI(url: url, method: .get, objectType: GuestSessionResponse.self) { (isSuccess, data, statusCode)  in
            completion(data as! GuestSessionResponse)
        }
    }
    
    func createRequestToken(completion: @escaping (RequestTokenResponse) -> Void) {
        let url = appConfig.hostUrl + "authentication/token/new"
        appService.requestAPI(url: url, method: .get, objectType: RequestTokenResponse.self) { (isSuccess, data, statusCode)  in
            completion(data as! RequestTokenResponse)
        }
    }

    func createSession(requestToken: String!, completion: @escaping (SessionResponse) -> Void) {
        var parameters: [String: AnyObject] = [:]
        parameters["request_token"] = requestToken as AnyObject?
        let url = appConfig.hostUrl + "authentication/session/new"
        appService.requestAPI(url: url, method: .post, parameters: parameters, objectType: SessionResponse.self) { (isSuccess, data, statusCode)  in
            completion(data as! SessionResponse)
        }
    }

    func createRequestTokenWithLogin(username: String!, password: String!, requestToken: String!, completion: @escaping (RequestTokenResponse) -> Void) {
        var parameters: [String: AnyObject] = [:]
        parameters["username"] = username as AnyObject?
        parameters["password"] = password as AnyObject?
        parameters["request_token"] = requestToken as AnyObject?
        let url = appConfig.hostUrl + "authentication/token/validate_with_login"
        appService.requestAPI(url: url, method: .post, parameters: parameters, objectType: RequestTokenResponse.self) { (isSuccess, data, statusCode)  in
            completion(data as! RequestTokenResponse)
        }
    }

    func deleteSession(sessionId: String!, completion: @escaping (StatusResponse) -> Void) {
        var parameters: [String: AnyObject] = [:]
        parameters["session_id"] = sessionId as AnyObject?
        let url = appConfig.hostUrl + "authentication/session"
        appService.requestAPI(url: url, method: .delete, objectType: StatusResponse.self) { (isSuccess, data, statusCode)  in
            completion(data as! StatusResponse)
        }
    }
    
}
