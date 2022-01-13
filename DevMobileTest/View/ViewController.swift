//
//  ViewController.swift
//  DevMobileTest
//
//  Created by acs macbookpro on 13/01/22.
//

import UIKit

class ViewController: UIViewController, MainViewDelegate {
    
    private let mainPresenter = MainPresenter(apiService: ApiService())

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var responseKandidatLabel: UILabel!
    @IBOutlet weak var responseOfficeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPresenter.setViewDelegate(delegate: self)
        
        responseKandidatLabel.text = "No request yet"
        responseOfficeLabel.text = "No request yet"
    }
    
    //MARK: - IBAction Handler
    
    @IBAction func saveDataKandidat(_ sender: Any) {
        let nameValid = validate(name: nameField.text)
        let addressValid = validate(address: addressField.text)
        let emailValid = validate(email: emailField.text)
        if nameValid && addressValid && emailValid{
            responseKandidatLabel.text = ""
            let kandidat = Kandidat(
                name: nameField.text!,
                address: addressField.text!,
                email: emailField.text!)
            mainPresenter.saveKandidatData(data: kandidat)
        }
    }
    
    @IBAction func saveDataOffice(_ sender: Any) {
        responseOfficeLabel.text = ""
        let office = Office(
            nid: 10,
            officeID: 20)
        mainPresenter.saveOfficeData(data: office)
    }
    
    //MARK: - Main View Delegation
    
    func displayKandidatResponse(data: KandidatResponse) {
        responseKandidatLabel.text = data.success! ? "Success" : "Failure"
    }
    
    func displayOfficeResponse(data: OfficeResponse) {
        responseOfficeLabel.text = data.success! ? "Success" : "Failure"
    }
    
    //MARK: - Form Validator
    
    func validate(name: String?) -> Bool {
        guard let mName = name else {
            // Nama kosong
            SimpleAlert.show(self, title: "Error", message: "Nama tidak boleh kosong")
            return false
        }
        if mName.count == 0 {
            SimpleAlert.show(self, title: "Error", message: "Nama tidak boleh kosong")
            return false
        } else if mName.count <= 10 {
            // Nama valid
            return true
        } else {
            SimpleAlert.show(self, title: "Error", message: "Nama lebih dari 10 huruf")
            return false
        }
    }
    
    func validate(address: String?) -> Bool {
        guard let mAddress = address else {
            // Address kosong
            SimpleAlert.show(self, title: "Error", message: "Alamat tidak boleh kosong")
            return false
        }
        if mAddress.count == 0 {
            SimpleAlert.show(self, title: "Error", message: "Alamat tidak boleh kosong")
            return false
        } else if mAddress.count <= 30 {
            // Address valid
            return true
        } else {
            SimpleAlert.show(self, title: "Error", message: "Alamat lebih dari 30 huruf")
            return false
        }
    }
    
    func validate(email: String?) -> Bool {
        guard let mEmail = email else {
            // Email kosong
            return false
        }
        let emailPattern = #"^\S+@\S+\.\S+$"#
        let result = mEmail.range(
            of: emailPattern,
            options: .regularExpression
        )
        if result != nil {
            // Email Valid
            return true
        } else {
            SimpleAlert.show(self, title: "Error", message: "Email tidak valid")
            return false
        }
    }
}

