//
//  API.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import UIKit

struct Config {
    static var target = Target(rawValue: "Development")
}

enum API : String {
    
    #if DEVELOPMENT
    case link = "https://api.github.com/" // DEVELOPMENT
    #else
        #if STAGING
        case link = "https://api.github.com/" // STAGING
        #else
        case link = "https://api.github.com/" // RELEASE
        #endif
    #endif
    
}

enum Target : String{
    case development = "Development"
    case staging = "Staging"
    case release = "Release"
    case debug = "Debug"
    case none = ""
}

enum APIMethods : String {
    case searchRepositories = "search/repositories"

    case repos = "repos/"
    
    
    case pulls = "pulls"
}



