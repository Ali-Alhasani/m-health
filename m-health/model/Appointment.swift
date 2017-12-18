//
//  Appointment.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation


class Appointment {
    
    
    init(appointmentID: Int, diagnoseID: Int, description: String, note: String, status: String, created:String) {
        self.appointmentID = appointmentID
        self.diagnoseID = diagnoseID
        self.description = description
        self.note = note
        self.status = status
        self.created = created
    }

    
    var appointmentID: Int
    var diagnoseID:Int
    var description : String
    var note: String
    var status: String
    var created:String

    
}
