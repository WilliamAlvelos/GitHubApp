//
//  UIView.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func cornerRadius(radius: CGFloat)
    {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func makeCircularView(){
        self.cornerRadius(radius: self.frame.width/2)
    }
    
    func cornerRadiusBottom(radius: CGFloat)
    {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: radius, height: radius)).cgPath
        
        self.layer.mask = rectShape
    }
    
    func cornerWithShadowBackground(radius: CGFloat, color: CGColor)
    {
        shadow(color: color)
        self.layer.cornerRadius = radius
    }
    
    func shadow(color: CGColor)
    {
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.8
        
        self.layer.masksToBounds = false
    }
    
    func shadowStatus(color: CGColor)
    {
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        
        self.layer.masksToBounds = false
    }
    
    func viewRoundedAndDarkShadow(color: CGColor)
    {
        shadowStatus(color: color)
        self.layer.cornerRadius = self.frame.size.height/2
    }
    
    func viewRoundedAndLightShadow(color: CGColor)
    {
        shadow(color: color)
        self.layer.cornerRadius = self.frame.size.height/2
    }
    
    
    func borderWidth(width: CGFloat, color: CGColor)
    {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    
    func lineBottomOnly(borderWidth: CGFloat, color: CGColor)
    {
        let border = CALayer()
        let width = borderWidth
        border.borderColor = color
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func takeScreenshot() -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func animateConstraintPositionY(constraint: NSLayoutConstraint, positionY: CGFloat, isHidden: Bool)
    {
        UIView.animate(withDuration: 1, animations: {
            self.isHidden = !isHidden
        }) { (success) in
            UIView.animate(withDuration: 1, animations: {
                constraint.constant = positionY
                self.layoutIfNeeded()
            }, completion: { (success) in
                self.isHidden = isHidden
            })
        }
    }

}
