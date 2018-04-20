//
//  Appointment.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation
import  SwiftyJSON

class Appointment {

    
    init(json: [String: Any]) {
        let json =  JSON(json)
        self.appointmentID = json["appointment_id"].intValue
        self.socialID = json["social_id"].stringValue
        self.patientName = json["patient_name"].stringValue
        self.gender = json["gender"].stringValue
        self.status = json["marital_status"].stringValue
        self.date = json["date"].stringValue
        self.time = json["time"].stringValue
    }
    


    var appointmentID: Int
    var socialID:String
    var patientName : String
    var gender: String
    var status: String
    var time:String
    var date:String

    
}
