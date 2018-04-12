//
//  ActivityIndicator.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView


public class ActivityIndicator: NSObject{
    
    static var isActive : Bool = false
    
    struct ActivitySize {
        static let height : CGFloat = 60.0
        static let width : CGFloat = 60.0
    }
    
    static var viewActivity : UIView?
    static var activityIndicator: NVActivityIndicatorView?
    
    
    private static func createSppiner(view: UIView) -> NVActivityIndicatorView{
        
        let frame = CGRect(x: view.center.x - (ActivitySize.width/2), y: view.center.y - (ActivitySize.height/2), width: ActivitySize.width, height: ActivitySize.height)
        let ActivityIndicator = NVActivityIndicatorView(frame: frame, type: .ballClipRotate, color: Colors.quinary)

        ActivityIndicator.startAnimating()
        view.addSubview(ActivityIndicator)
        
        return ActivityIndicator
    }
    

    
    static func show(view:UIView){
        
        if self.isActive{
            ActivityIndicator.stopAnimating()
        }
        
        let mainView = UIApplication.shared.keyWindow!.rootViewController!.view!
        
        viewActivity = UIView(frame: CGRect(x: mainView.frame.origin.x, y: mainView.frame.origin.y, width: mainView.frame.width, height: view.bounds.height))
        viewActivity!.backgroundColor = Colors.primary.withAlphaComponent(0.3)
        viewActivity!.center = view.center
        view.addSubview(viewActivity!)

        self.activityIndicator = createSppiner(view: view)
        self.isActive = true
    }
    
    static func stopAnimating(){
        self.isActive = false
        self.viewActivity?.isHidden = true
        self.activityIndicator?.stopAnimating()
        viewActivity?.removeFromSuperview()
    }
}
