//
//  String.swift
//  GitHub
//
//  Created by William Alvelos on 20/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation

extension String{
    static func formatDate(dateStr: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "dd/MM/yyyy"
        
        let date = dateFormatter.date(from: dateStr)
        
        return date != nil ? dateFormatterString.string(from: date!) : "Data não encontrada"
    }

}
