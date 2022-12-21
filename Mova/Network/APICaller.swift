//
//  APICaller.swift
//  Mova
//
//  Created by HauNguyen on 20/12/2565 BE.
//

import UIKit
import Alamofire

class APICaller {
    
    static let shared: APICaller = APICaller()
        
    /// Get Trending Movies
    func getTrendingMovies(completion: @escaping (Result<BaseResponse<Trending>, Error>) -> Void) {
        AppService.shared.requestAPI(url: "\(BaseURL.shared.baseUrl)trending/movie/day?api_key=\(BaseURL.shared.apiKey)", method: .get, objectType: BaseResponse<Trending>.self, encoding: JSONEncoding.prettyPrinted) { isSuccess, data, statusCode in
            
            if isSuccess {
                guard let _data = data as? BaseResponse<Trending> else { return print("\(RequestAPIWithError.FailedToConvertData.rawValue)") }
                completion(.success(_data))
            } else {
                completion(.failure(RequestAPIWithError.FailedTogetData))
            }
            
        }
    }
    
}
