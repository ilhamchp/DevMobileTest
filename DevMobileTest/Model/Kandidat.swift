//
//  Kandidat.swift
//  DevMobileTest
//
//  Created by acs macbookpro on 13/01/22.
//

import Foundation

class Kandidat: Codable {
    var name: String
    var address: String
    var email: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case address = "address"
        case email = "email"
    }

    init(name: String, address: String, email: String) {
        self.name = name
        self.address = address
        self.email = email
    }
}
