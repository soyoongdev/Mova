//
//  CertificationResponse.swift
//  Mova
//
//  Created by HauNguyen on 21/12/2565 BE.
//

import Foundation

struct CertificationResponses: Codable {
    var certifications: CertificationResponse
}

struct CertificationResponse: Codable {
    var _ca: [CertificationInfomation]
    var _nl: [CertificationInfomation]
    var _gb: [CertificationInfomation]
    var _au: [CertificationInfomation]
    var _fr: [CertificationInfomation]
    var _nz: [CertificationInfomation]
    var _br: [CertificationInfomation]
    var _pt: [CertificationInfomation]
    var _no: [CertificationInfomation]
    var _ru: [CertificationInfomation]
    var _it: [CertificationInfomation]
    var _de: [CertificationInfomation]
    var _dk: [CertificationInfomation]
    var _us: [CertificationInfomation]
    var _fi: [CertificationInfomation]
    var _lt: [CertificationInfomation]
    var _ph: [CertificationInfomation]
    var _my: [CertificationInfomation]
    var _se: [CertificationInfomation]
    var _hu: [CertificationInfomation]
    var _in: [CertificationInfomation]
    var _bg: [CertificationInfomation]
    var _ca_qc: [CertificationInfomation]
    
    enum CodingKeys: String, CodingKey {
        case _ca = "CA"
        case _nl = "NL"
        case _gb = "GB"
        case _au = "AU"
        case _fr = "FR"
        case _nz = "NZ"
        case _br = "BR"
        case _pt = "PT"
        case _no = "NO"
        case _ru = "RU"
        case _it = "IT"
        case _de = "DE"
        case _dk = "DK"
        case _us = "US"
        case _fi = "FI"
        case _lt = "LT"
        case _ph = "PH"
        case _my = "MY"
        case _se = "SE"
        case _hu = "HU"
        case _in = "IN"
        case _bg = "BG"
        case _ca_qc = "CA-QC"
    }
}

struct CertificationInfomation: Codable {
    var certification: String
    var meaning: String
    var order: Int
}
