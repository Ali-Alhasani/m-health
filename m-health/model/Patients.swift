//
//  Patients.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/23/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation
import SwiftyJSON
class Patients{

    
    init(json: [String: Any]) {
        let json =  JSON(json)
        self.id = json["id"].intValue
        self.socialId = json["social_id"].stringValue
        self.firstName = json["first_name"].stringValue
        self.middleName = json["middle_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.maritalStatus = json["patient_name"].stringValue
        self.email = json["email"].stringValue
        self.dob = json["DOB"].stringValue
        self.phone = json["phone"].stringValue
        self.mobile = json["mobile"].stringValue
        self.gender = json["gender"].stringValue
        self.avatar = json["avatar"].stringValue
        self.address = json["address"].stringValue
        
       
    }
  
    let id:Int?
    let socialId:String?
    let firstName:String?
    let middleName:String?
    let lastName:String?
    let maritalStatus:String?
    let email:String?
    let dob:String?
    let phone:String?
    let mobile:String?
    let gender:String?
    let avatar:String?
    let address:String?
}
