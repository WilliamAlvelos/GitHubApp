//
//  UIImageView.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import UIKit

extension UISearchController {
    
    func configWith(delegate: UISearchBarDelegate){
        self.searchBar.delegate = delegate
        self.searchBar.barStyle = .blackTranslucent
        self.searchBar.placeholder = "Pesquisar"
        self.searchBar.tintColor = Colors.quinary
        self.searchBar.barTintColor = Colors.primary
    }
}

