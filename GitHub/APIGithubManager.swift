//
//  APIGithubManager.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIGithubManager{
    
    static var page = 1
    
    // MARK: GET REPOSITORIES LIST
    static func getRepositoriesList(query: String, sort: String, success:@escaping (_ total_count: Int, _ incomplete_results: Bool, _ repositories: [Repository]) -> Void, failure:@escaping (Error) -> Void){
        
        APIManager.getFrom(API.link.rawValue + APIMethods.searchRepositories.rawValue + "?\(query)\(sort)page=\(page)") { (result) in
            if (result as? Data) != nil {
                let json = JSON(result!)
                
                if(json["message"] != JSON.null){
                    failure(NSError(domain: json["message"].stringValue, code: AlamoError.JSONReturnErro.rawValue, userInfo: nil))
                }
                else{
                    var repositories: [Repository] = [Repository]()
                    
                    for repository in json["items"].arrayValue{
                        repositories.append(Repository(json: repository))
                    }

                    success(json["total_count"].intValue , json["incomplete_results"].boolValue, repositories)
                    
                }
            }else if let error = result as? Error {
                failure(error)
            }
            else {
                failure(NSError(domain: "", code: AlamoError.JSONNil.rawValue, userInfo: nil))
            }
            
        }
        
    }
    
    // MARK: GET PULL REQUESTS LIST
    static func getPullRequestsList(repository: Repository?, success:@escaping(_ pullRequests: [PullRequest], _ open: Int, _ close: Int) -> Void, failure:@escaping (Error) -> Void){
        
        APIManager.getFrom(API.link.rawValue + APIMethods.repos.rawValue + "\(repository?.full_name ?? "")/" + APIMethods.pulls.rawValue) { (result) in
            if (result as? Data) != nil {
                let json = JSON(result!)
                
                var opened = 0
                var closed = 0
    
                if(json["message"] != JSON.null){
                    failure(NSError(domain: json["message"].stringValue, code: AlamoError.JSONReturnErro.rawValue, userInfo: nil))
                }
                else{
                    var pullRequests: [PullRequest] = [PullRequest]()
                    
                    for pullRequest in json.arrayValue{
                        pullRequests.append(PullRequest(json: pullRequest))
                        
                        if pullRequests.last?.state == "open" {
                            opened += 1
                        }else{
                            closed += 1
                        }
                    }
                    
                    success(pullRequests, opened, closed)
                }
            }else if let error = result as? Error {
                failure(error)
            }
            else {
                failure(NSError(domain: "", code: AlamoError.JSONNil.rawValue, userInfo: nil))
            }
            
            
        }
        
    }
    

}
