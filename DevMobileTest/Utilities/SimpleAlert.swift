//
//  SimpleAlert.swift
//  DevMobileTest
//
//  Created by acs macbookpro on 13/01/22.
//

import Foundation
import UIKit

class SimpleAlert{
    static func show(_ view: UIViewController, title: String, message: String? = ""){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            print("OK button selected")
        }))

        view.present(alert, animated: true, completion: nil)
    }
}
