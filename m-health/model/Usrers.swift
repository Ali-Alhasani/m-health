//
//  Usrers.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/12/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation

class Usrers {
    init(){
        
    }
    
    init(usrersID: Int, roleID: Int, soicalID: Int, firstName: String, lastName: String, middleName: String, mobile: String, phone: String, gender: String, DoB: Date, address: String, email: String, avatar: String, password: String, rememberToken: String, specialist:String,userName: String,bio:String) {
        self.usrersID = usrersID
        self.roleID = roleID
        self.soicalID = soicalID
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.userName = userName
        self.mobile = mobile
        self.phone = phone
        self.gender = gender
        self.DoB = DoB
        self.address = address
        self.email = email
        self.avatar = avatar
        self.password = password
        self.rememberToken = rememberToken
        self.specialist = specialist
        self.bio = bio

    }
    
    
    var usrersID: Int?
    var roleID:Int?
    var soicalID: Int?
    var firstName : String?
    var lastName: String?
    var middleName: String?
    var userName: String?
    var mobile:String?
    var phone:String?
    var gender:String?
    var DoB:Date?
    var address: String?
    var email: String?
    var avatar:String?
    var password:String?
    var rememberToken:String?
    var specialist:String?
    var bio:String?
    
    
}
