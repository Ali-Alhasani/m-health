//
//  Uview.swift
//  NakhatZaman
//
//  Created by Ali Al-Hassany on 3/17/18.
//  Copyright © 2018 Ali Al-Hassany. All rights reserved.
//

import UIKit

extension UIView{
    
    func setTopRoundedCorners(radius: CGFloat){
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
        
    }
    
    func setBottomBorder(color: UIColor, height: CGFloat = 1) -> Void {
        
        let layer = CALayer.init()
        layer.backgroundColor = color.cgColor
        layer.frame = CGRect(x: 0, y: self.frame.height - height, width: self.frame.width, height: height)
        self.layer.addSublayer(layer)
        
    }
    
    func setBottomTopBorder(color: UIColor, height: CGFloat = 1) -> Void {
        
        let layer = CALayer.init()
        layer.backgroundColor = color.cgColor
        layer.frame = CGRect(x: 0, y: self.frame.size.height - height, width: self.frame.size.width, height: height)
        
        let layer2 = CALayer.init()
        layer2.backgroundColor = color.cgColor
        layer2.frame = CGRect(x: 0, y:0, width: self.frame.size.width, height: 1)
        
        self.layer.addSublayer(layer)
        self.layer.addSublayer(layer2)
        
    }
    
    func setTopBorder(color: UIColor, height: CGFloat = 1) -> Void {
        
        let layer = CALayer.init()
        layer.backgroundColor = color.cgColor
        layer.frame = CGRect(x: 0, y:0, width: self.frame.size.width, height: 1)
        
        self.layer.addSublayer(layer)
    }
    
    func setAsCircle(cornerRadius: CGFloat,borderColor: UIColor, borderWidth: CGFloat) -> Void{
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func setAsCircle(cornerRadius: CGFloat) -> Void{
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func showActivityIndicator() -> UIView {
        let container: UIView = UIView()
        container.frame = self.frame
        container.center = self.center
        //container.backgroundColor = UIColor.UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = self.center
        //loadingView.backgroundColor = UIColor.UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x : 0.0, y : 0.0, width : 40.0, height:  40.0);
        actInd.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        actInd.center = CGPoint(x : loadingView.frame.size.width / 2,
                                y : loadingView.frame.size.height / 2);
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        addSubview(container)
        actInd.startAnimating()
        return container
    }
    
    func hideActivityIndicatory(view : UIView) {
        view.removeFromSuperview()
    }
    
    
}


