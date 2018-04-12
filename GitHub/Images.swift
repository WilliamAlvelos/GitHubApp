//
//  Images.swift
//  GitHub
//
//  Created by William Alvelos on 18/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import UIKit

class Images {
    #if Development
        // DEVELOPMENT
        static let userPlaceholder = UIImage(named: "placeholder_user")
        
        static let errorPlaceholder = UIImage(named: "placeholder_error")
    
        static let icStar = UIImage(named: "ic_star")
    
        static let icFork = UIImage(named: "ic_fork")
    #else
        #if Staging
            // STAGING
            static let userPlaceholder = UIImage(named: "placeholder_user")
            
            static let errorPlaceholder = UIImage(named: "placeholder_error")
    
            static let icStar = UIImage(named: "ic_star")
    
            static let icFork = UIImage(named: "ic_fork")
        #else
            // RELEASE
            static let userPlaceholder = UIImage(named: "placeholder_user")
            
            static let errorPlaceholder = UIImage(named: "placeholder_error")
    
            static let icStar = UIImage(named: "ic_star")

            static let icFork = UIImage(named: "ic_fork")
        #endif
    #endif
}
