//
//  Radiology.swift
//  m-health
//
//  Created by Ali Al-Hassany on 4/20/18.
//  Copyright © 2018 Ali Al-Hassany. All rights reserved.
//

import Foundation
import SwiftyJSON

class Radiology {
    
    init(json: [String: Any]) {
        let json =  JSON(json)
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
    }
    
    init(){
        
    }
    var id:Int?
    var name:String?
    var note:String?
}
