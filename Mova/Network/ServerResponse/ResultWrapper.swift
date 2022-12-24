//
//  ResultWrapper.swift
//  Mova
//
//  Created by HauNguyen on 24/12/2565 BE.
//

import Foundation

struct ResultsWrapper<T: Decodable>: Decodable {
    var id: Int?
    var results: [T]
}

// Temporarily adding in until we rework these wrappers
struct ResultsStringWrapper<T: Decodable>: Decodable {
    var id: String?
    var results: [T]
}

struct GenresWrapper<T: Decodable>: Decodable {
    var id: Int?
    var genres: [T]
}

struct KeywordWrapper<T: Decodable>: Decodable {
    var id: Int?
    var keywords: [T]
}

struct ProfilesWrapper<T: Decodable>: Decodable {
    var id: Int?
    var profiles: [T]
}

struct TranslationsWrapper<T: Decodable>: Decodable {
    var id: Int?
    var translations: [T]
}

struct TranslationWrapper<T: Decodable>: Decodable {
    var id: Int?
    var translations: T
}
