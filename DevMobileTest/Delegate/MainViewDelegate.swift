//
//  MainViewDelegate.swift
//  DevMobileTest
//
//  Created by acs macbookpro on 13/01/22.
//

import Foundation

protocol MainViewDelegate: NSObjectProtocol {
    func displayKandidatResponse(data: KandidatResponse)
    func displayOfficeResponse(data: OfficeResponse)
}
