//
//  Durgs.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/30/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation
import SwiftyJSON

class Drugs{
    
    init(){
        
    }
    
    init(name:String, dose:String, route:String, frequency:String, direction:String, duration:String, note:String, indication:String,necessaryFlag:String,startDate:String,endDate:String,internalNote:String,sideEffects:String,id:Int ) {
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
        self.id = id
        self.sideEffects = sideEffects
        
    }
    
    init(json: [String: Any]) {
        let json =  JSON(json)
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.sideEffects = json["side_effects"].stringValue
    }
    var id:Int?
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
    var sideEffects:String?
}
