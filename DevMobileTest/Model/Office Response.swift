//
//  Office Response.swift
//  DevMobileTest
//
//  Created by acs macbookpro on 13/01/22.
//

import Foundation

class OfficeResponse: Codable {
    var success: Bool?

    enum CodingKeys: String, CodingKey {
        case success = "success"
    }

    init(success: Bool?) {
        self.success = success
    }
}
