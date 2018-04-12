//
//  Colors.swift
//  GitHub
//
//  Created by William Alvelos on 16/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    #if Development
        // DEVELOPMENT
        static let primary = UIColor(red: 52/255, green: 52/255, blue: 56/255, alpha: 1) //preto
    
        static let secondary = UIColor(red: 89/255, green: 138/255, blue: 178/255, alpha: 1) //azul
        
        static let tertiary = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1) //cinza
        
        static let quaternary = UIColor(red: 237/255, green: 138/255, blue: 25/255, alpha: 1) //laranja
        
        static let quinary = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1) //branco
    #else
        #if Staging
            // STAGING
            static let primary = UIColor(red: 52/255, green: 52/255, blue: 56/255, alpha: 1) //preto
            
            static let secondary = UIColor(red: 150/255, green: 184/255, blue: 209/255, alpha: 1) //azul
            
            static let tertiary = UIColor(red: 237/255, green: 138/255, blue: 25/255, alpha: 1) //laranja
            
            static let quaternary = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1) //cinza
            
            static let quinary = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1) //branco
        #else
            // RELEASE
            static let primary = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1) //cinza
    
            static let secondary = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1) //branco
    
            static let tertiary = UIColor(red: 237/255, green: 138/255, blue: 25/255, alpha: 1) //laranja
    
            static let quaternary = UIColor(red: 150/255, green: 184/255, blue: 209/255, alpha: 1) //azul
    
            static let quinary = UIColor(red: 52/255, green: 52/255, blue: 56/255, alpha: 1) //preto
        #endif
    #endif
}

