//
//  SessionManager
//  NakhatZaman
//
//  Created by Ali Al-Hassany on 1/18/18.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class SessionManager: NSObject {
    
    var baseUrl: String = "http://mhealth.salah.space/api/"
    var token: String = ""
    var phoneNumber:String = ""
    var isDoctorLogged: Bool = false
    var isPatientLogged: Bool = false
    var userId:String = ""
    var scroll:Int = 1
    var weekEndDay:Int = 1

    class var shared: SessionManager{
        struct Static{
            static let instance = SessionManager()
        }
        return Static.instance
    }
    
    class func loadSessionManager(){
        guard let tempDic = UserDefaults.standard.value(forKey: "SessionManager") as? Dictionary<String, Any> else {return}
        guard let userID = UserDefaults.standard.value(forKey: "userId") as? String else {return}
   

        SessionManager.shared.token = tempDic["token"] as! String
        SessionManager.shared.userId = userID
    
        if let boolValue = tempDic["isDoctorLogged"] as? Bool {
            SessionManager.shared.isDoctorLogged = boolValue
            if boolValue{
                print( SessionManager.shared.token)
               // let decodedNSData = UserDefaults.standard.object(forKey: "User") as! Data
              //  let currentUser = NSKeyedUnarchiver.unarchiveObject(with: decodedNSData) as! User
              //  SessionManager.shared.currentUser = currentUser
                
            }
        }
        
        if let boolValue = tempDic["isPatientLogged"] as? Bool {
            SessionManager.shared.isPatientLogged = boolValue
            if boolValue{
                print( SessionManager.shared.token)
                // let decodedNSData = UserDefaults.standard.object(forKey: "User") as! Data
                //  let currentUser = NSKeyedUnarchiver.unarchiveObject(with: decodedNSData) as! User
                //  SessionManager.shared.currentUser = currentUser
                
            }
        }
        
     
    }
    
     class func loadPhoneNumber(){
        guard let tempPhone = UserDefaults.standard.value(forKey: "phoneNumber") as? String else {return}
          SessionManager.shared.phoneNumber = tempPhone
        print( SessionManager.shared.phoneNumber)
    }
   
    
   
    class func saveSessionManager(){
        var tempDic:Dictionary<String,Any> = [:]
        tempDic["token"] = SessionManager.shared.token
        tempDic["isDoctorLogged"] = SessionManager.shared.isDoctorLogged
        tempDic["isPatientLogged"] = SessionManager.shared.isPatientLogged
    
        let userID = SessionManager.shared.userId
        let phoneNumber = SessionManager.shared.phoneNumber
     
     //   guard let currentUser = SessionManager.shared.currentUser else {return}
        // UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: currentUser), forKey: "User")
        UserDefaults.standard.set(tempDic, forKey: "SessionManager")
        UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
        UserDefaults.standard.set(userID, forKey: "userId")
        
        

        
    }
    class func loadCalender(){
        guard let tempDic = UserDefaults.standard.value(forKey: "Calendar") as? Dictionary<String, Any> else {return}
        
        SessionManager.shared.scroll = tempDic["scroll"] as! Int
        SessionManager.shared.weekEndDay = tempDic["weekday"] as! Int

    }
    
    
    class func saveCalender(){
       var tempDic:Dictionary<String,Any> = [:]
        tempDic["scroll"] = SessionManager.shared.scroll
        tempDic["weekday"] = SessionManager.shared.weekEndDay
        
        UserDefaults.standard.set(tempDic, forKey: "Calendar")

    }
    
    class func clearSessionManager(){
        UserDefaults.standard.removeObject(forKey: "SessionManager")
        UserDefaults.standard.removeObject(forKey: "phoneNumber")
        UserDefaults.standard.removeObject(forKey: "userId")
          UserDefaults.standard.removeObject(forKey: "Calendar")


        SessionManager.shared.token = ""
        SessionManager.shared.isDoctorLogged = false
          SessionManager.shared.isPatientLogged = false
        SessionManager.shared.userId = ""
        SessionManager.shared.scroll = 1
        SessionManager.shared.weekEndDay = 1

    }
    
    

    class func getUrlWithLang() -> String {
        if currentLanguage() == Language.arabic {
            return SessionManager.shared.baseUrl + "ar/"
        }else {
            return SessionManager.shared.baseUrl + "en/"
        }
    }
    
    class func currentLanguage() -> Language{
        let langStr = Locale.current.languageCode
        
        if  (langStr?.contains("ar"))!{
            
            return Language.arabic
        }else{
            
            return Language.english
        }
    }
    
}


enum Language{
    case arabic,english
}


