//
//  Doctors.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation
class Doctors {


    init(doctorsID: Int, userID: Int, clincID: Int, bio: String, specilist: String, clincName: String) {
        self.doctorsID = doctorsID
        self.userID = userID
        self.clincID = clincID
        self.bio = bio
        self.specilist = specilist
        self.clincName = clincName
    }
    
    var doctorsID: Int
    var userID:Int
    var clincID: Int
    var clincName: String
    var bio : String
    var specilist: String
   

}
