//
//  LLError.swift
//  limitless
//
//  Copyright © 2017 A2A. All rights reserved.
//

import UIKit

class LLError: NSObject, Error {

    var status:Int
    var message:String
    var errors:String
    
    init(status: Int, message: String, errors: String) {
        self.status = status
        self.errors = errors
        self.message = message
    }
}
