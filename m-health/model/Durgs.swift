//
//  Durgs.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/30/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation


class Durgs{
    
    init(){
        
    }
    
    init(name:String, dose:String, route:String, frequency:String, direction:String, duration:String, note:String, indication:String,necessaryFlag:String,startDate:String,endDate:String,internalNote:String ) {
        self.name = name
        self.dose = dose
        self.route = route
        self.frequency = frequency
        self.direction = direction
        self.duration = duration
        self.note = note
        self.indication = indication
        self.necessaryFlag = necessaryFlag
        self.startDate = startDate
        self.endDate = endDate
        self.internalNote = internalNote
        
    }
    var name:String?
    var dose:String?
    var route:String?
    var frequency:String?
    var direction:String?
    var duration:String?
    var note:String?
    var indication:String?
    var necessaryFlag:String?
    var startDate:String?
    var endDate:String?
    var internalNote:String?
    
}
