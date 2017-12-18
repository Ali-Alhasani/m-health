//
//  Patients.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/23/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation
class Patients{
    init(socialId:String,firstName:String,middleName:String,lastName:String,maritalStatus:String,email:String,dob:String,phone:String, mobile:String,gender:String) {
        self.socialId = socialId
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.maritalStatus = maritalStatus
        self.email = email
        self.dob = dob
        self.phone = phone
        self.mobile = mobile
        self.gender = gender
        
    }
    
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
}
