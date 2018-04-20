//
//  TextView.swift
//  Gasil
//
//  Created by Ali Al-Hassany on 02/20/18.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class TextView: UITextView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
 
    @IBInspectable var borderColor: UIColor?
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var conrnerRaduis: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = conrnerRaduis
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
    }

}
