//
//  MainPresenter.swift
//  DevMobileTest
//
//  Created by acs macbookpro on 13/01/22.
//

import Foundation

class MainPresenter{
    private let apiService: ApiService
    private var mainViewDelegate: MainViewDelegate?
    
    init(apiService: ApiService){
        self.apiService = apiService
    }
    
    func setViewDelegate(delegate: MainViewDelegate?){
        self.mainViewDelegate = delegate
    }
    
    func saveKandidatData(data: Kandidat) {
        apiService.postKandidat(data: data) { [weak self] response in
            if let kandidatResponse = response {
                self?.mainViewDelegate?.displayKandidatResponse(data: kandidatResponse)
            }
        }
    }
    
    func saveOfficeData(data: Office) {
        apiService.postOffice(data: data) { [weak self] response in
            if let officeResponse = response {
                self?.mainViewDelegate?.displayOfficeResponse(data: officeResponse)
            }
        }
    }
}
