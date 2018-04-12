//
//  UIViewController.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func configTitle(title: String) {
        self.title = title
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: Colors.quinary]
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont (name: "HelveticaNeue-Light", size: 17)!, NSAttributedStringKey.foregroundColor: Colors.quinary]
        self.navigationController?.navigationBar.tintColor = Colors.quinary
        self.navigationController?.navigationBar.barTintColor = Colors.primary
    }
    
    func hideBackButton(){
        ActivityIndicator.stopAnimating()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}
