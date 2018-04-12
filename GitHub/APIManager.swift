//
//  APIManager.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import Alamofire

class APIManager: NSObject {
    
    //MARK:- Api manager method get
    static func getFrom(_ url: String, _ parameters: Dictionary<String, Any>? = nil, _ headers: [String:String]? = nil ,  completion: @escaping(Any?) -> Void) {
        
        Alamofire.request(url, method: .get, parameters: parameters, headers: headers)
            .validate(statusCode: 200..<405)
            .responseJSON { (response) in
                print("GET: \(response.request?.url?.absoluteString ?? "")")
                
                switch response.result {
                case .success:
                    completion(response.data)
                    break
                    
                case .failure(let error):
                    completion(error)
                    break
                }
        }
    }
    
    
}
    
