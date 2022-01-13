//
//  ApiService.swift
//  DevMobileTest
//
//  Created by acs macbookpro on 13/01/22.
//

import Foundation
import Alamofire

class ApiService {
    func postKandidat(data: Kandidat, completion: @escaping (KandidatResponse?)->() ) {
        let path = "yDZ0D96qnktG9yjj9KNe"
        let url = URL(string:Constants.BaseURL.rawValue + path)

        let encoder = JSONEncoder()
        let body = data
        let jsonData = try! encoder.encode(body)
        
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        AF.request(request)
            .responseDecodable(of: KandidatResponse.self) { response in
                switch(response.result) {
                case .success(_):
                    completion(response.value)
                case .failure(_):
                    if let data = response.data {
                        let jsonString = String(data: data, encoding: String.Encoding.utf8)
                        print("Failure Response: \(String(describing: jsonString))")
                        if let resp = try? JSONDecoder().decode(KandidatResponse.self, from: data) {
                            completion(resp)
                            return
                        }
                        completion(nil)
                    }else{
                        completion(nil)
                    }
                }
            }
    }
    
    func postOffice(data: Office, completion: @escaping (OfficeResponse?)->() ) {
        let path = "yDZ0D96qnktG9yjj9KNe"
        let url = URL(string:Constants.BaseURL.rawValue + path)

        let encoder = JSONEncoder()
        let body = data
        let jsonData = try! encoder.encode(body)
        
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        AF.request(request)
            .responseDecodable(of: OfficeResponse.self) { response in
                switch(response.result) {
                case .success(_):
                    completion(response.value)
                case .failure(_):
                    if let data = response.data {
                        let jsonString = String(data: data, encoding: String.Encoding.utf8)
                        print("Failure Response: \(String(describing: jsonString))")
                        if let resp = try? JSONDecoder().decode(OfficeResponse.self, from: data) {
                            completion(resp)
                            return
                        }
                        completion(nil)
                    }else{
                        completion(nil)
                    }
                }
            }

    }
}
