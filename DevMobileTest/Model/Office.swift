//
//  Office.swift
//  DevMobileTest
//
//  Created by acs macbookpro on 13/01/22.
//

import Foundation

class Office: Codable {
    var nid: Int
    var officeID: Int

    enum CodingKeys: String, CodingKey {
        case nid = "nid"
        case officeID = "officeId"
    }

    init(nid: Int, officeID: Int) {
        self.nid = nid
        self.officeID = officeID
    }
}
