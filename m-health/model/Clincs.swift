//
//  Clinics.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation
class Clincs {
    init(){
        
    }
    init(clincID: Int, clincName: String, mobile: String, phone: String, address: String, email: String) {
        self.clincID = clincID
        self.clincName = clincName
        self.mobile = mobile
        self.phone = phone
        self.address = address
        self.email = email
    }
    
    var clincID: Int?
    var clincName: String?
    var mobile:String?
    var phone:String?
    var address: String?
    var email: String?
    
}
