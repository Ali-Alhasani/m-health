//
//  DataClient.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/22/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class DataClient{
    var allRadiology = [Radiology]()
    var allLaboratory = [Radiology]()
    class var shared: DataClient{
        struct Static{
            static let instance = DataClient()
        }
        return Static.instance
    }
    
    private init() {}
    
    
    func login(userName:String, password:String, completed: @escaping (_ name: String, _ email:String , _ token: String)-> () , failed: @escaping (_ error:LLError) -> () ){
        let functionUrl = "login"
        let parameters = ["username": userName, "password": password]
        APIClient.sendRequest(path: functionUrl, httpMethod: .post, parameters: parameters, success: { (response) in
            let responseData = response as? [String : Any] ?? [:]
            let json = JSON(responseData)
            let name = json["first_name"].stringValue
            let email = json["email"].stringValue
            let token = json["token"].stringValue
            SessionManager.shared.token = token
            SessionManager.shared.isDoctorLogged = true
            SessionManager.saveSessionManager()
            completed(name,email,token)
        }) { (_ error) in
            failed(error)
        }
        
    }
    
    func registerdoctor(first_name:String,middle_name:String,last_name:String, password:String, email:String, bio:String,specilist:String,phone:String,mobile:String ,completed: @escaping ()-> () , failed: @escaping (_ error:LLError) -> () ){
        print(first_name, middle_name, last_name, password, email, bio ,specilist,phone, mobile)
        let functionUrl =  "register"
        let parameters = ["first_name": first_name,"middle_name": middle_name,"last_name": last_name,"phone": phone,"mobile": mobile,"email":email, "password":password, "bio":bio,"specilist":specilist,"user_type":"1"]
        APIClient.sendRequest(path: functionUrl, httpMethod: .post, parameters: parameters, success: { (response) in
            
            completed()
            
        }) { (_ error) in
            failed(error)
        }
    }
    
    
    
    
    func registerclinic(name:String, mobile:String, address:String, completed: @escaping ()-> () , failed: @escaping (_ error:LLError) -> () ){
        let functionUrl = "clinic/create"
        let parameters = ["name": name, "mobile":mobile, "address":address]
        
        APIClient.sendRequest(path: functionUrl, httpMethod: .post, parameters: parameters, success: { (response) in
            
            
            completed()
        }) { (_ error) in
            failed(error)
        }
    }
    
    func addpatient(idNumber:String,firstName:String,middleName:String,lastName:String,address:String,maritalStatus:String,mobileNumber:String, phoneNumber:String, gender:String, email:String,birthday:String, completed: @escaping (_ socialId:String,_ firstName:String,_ lastName:String)-> () , failed: @escaping (_ error:LLError) -> () ){
        let functionUrl =  "register"
        let parameters = ["social_id": idNumber, "first_name":firstName, "middle_name":middleName,"last_name":lastName, "marital_status":maritalStatus,"email":email,"password": "123456" ,"dob":birthday,"phone":phoneNumber,"mobile":mobileNumber,"gender":gender,"user_type":"2"]
        APIClient.sendRequest(path: functionUrl, httpMethod: .post, parameters: parameters, success: { (response) in
            let responseData = response as? [String : Any] ?? [:]
            let json = JSON(responseData)
            let socialId = json["social_id"].stringValue
            let firstName = json["first_name"].stringValue
            let lastName = json["last_name"].stringValue
            completed(socialId,firstName,lastName)
        }) { (_ error) in
            failed(error)
        }
    }
    func getPatientBySocialID(idNumber:String, completed: @escaping (_ patient:Patients)-> () , failed: @escaping (_ error:LLError) -> () ){
        let functionUrl =  "patient/" + idNumber
        
        
        APIClient.sendRequest(path: functionUrl, httpMethod: .get, parameters: [:], success: { (response) in
            let responseData = response as? [String : Any] ?? [:]
            var patient:Patients?
            patient = Patients(json: responseData)
            
            completed(patient!)
            
        }) { (_ error) in
            failed(error)
        }
        
    }
    
    func allpatients(completed: @escaping (_ allPatients:[Patients])-> () , failed: @escaping (_ error:LLError) -> ()){
        let functionUrl =  "patients"
        
        APIClient.sendRequest(path: functionUrl, httpMethod: .get, parameters: [:], success: { (response) in
            let responseData = response as? [[String : Any]] ?? [[:]]
            
            var patinets = [Patients]()
            responseData.forEach({ (data) in
                patinets.append(Patients(json: data))
            })
            completed(patinets)
            
            
        }) { (_ error) in
            failed(error)
        }
        
        
    }
    
    func getdoctorPorfile(completed: @escaping (_ name:String,_ address:String,_ clinicName:String,_ bio:String)-> () , failed: @escaping (_ error:LLError) -> () ){
        let functionUrl = "doctor/profile"
        
        APIClient.sendRequest(path: functionUrl, httpMethod: .get, parameters: [:], success: { (response) in
            let responseData = response as? [String : Any] ?? [:]
            let json = JSON(responseData)
            
            let specilist = json["specilist"].stringValue
            let clinicName = json["clinic_name"].stringValue
            let address = json["address"].stringValue
            let name = json["name"].stringValue
            completed(name,address,clinicName,specilist)
            
        }) { (_ error) in
            failed(error)
        }
    }
 
    func createDiagnose (patient_id:Int, arival_case:String,payed:Int,importance:String,diagnose:String,diagnose_description:String,pathological_case:String,status:String,allDrugs:[Drugs],appointment_date:String, appointment_time:String,laboratory:Radiology?, radiology:Radiology?,completed: @escaping (_ message:String)-> () , failed: @escaping (_ error:LLError) -> () ){
        let functionUrl =  "appoiment/all/create"
        
        
        
        let diagnose:JSON = ["patient_id":patient_id,"arival_case":arival_case,"payed":payed,"importance":importance,"diagnose":diagnose,"diagnose_description": diagnose_description]
        let appointment:JSON = ["pathological_case":pathological_case,"status":status]
        let next_appointment:JSON = ["appointment_date":appointment_date,"appointment_time":appointment_time]
        
        var drugs = [[String:Any]]()
        for i in allDrugs{
            drugs.append(["name" :i.name! ,"dose" :i.dose!,"route":i.route!, "frequency":i.frequency!,"direction":i.direction!,"duration":i.duration!,"note":i.note!,"indication":i.indication!,"necessary_flag":"false","start_date":i.startDate!,"end_date":i.endDate!,"internal_note":i.internalNote!,"side_effects":i.sideEffects!,"id":i.id!])
        }
        let allDurges = JSON(drugs)
        var parameters = ["diagnose":diagnose,"appointment":appointment,"drugs":allDurges,"next_appointment":next_appointment] as [String : Any]
        if let radiology = radiology , let laboratory = laboratory {
            let tmpRadiology:JSON = ["radiology_name":radiology.name ?? "" ,"note":radiology.note ?? ""]
            
            let tmpLaboratory:JSON = ["laboratory_name":laboratory.name ?? "" ,"note": laboratory.note ?? ""]
            parameters = ["diagnose":diagnose,"appointment":appointment,"drugs":allDurges,"next_appointment":next_appointment, "radiology":tmpRadiology,"laboratory" : tmpLaboratory] as [String : Any]
        }
        
        
        
        
        APIClient.sendRequest(path: functionUrl, httpMethod: .post, parameters: parameters, success: { (response) in
            let responseData = response as? [String : Any] ?? [:]
            let json = JSON(responseData)
            
            let message = json["message"].stringValue
            completed(message)
        }) { (_ error) in
            failed(error)
        }
        
        
    }
    
    func getDoctorAppointments(flag:Int ,completed: @escaping (_ doctorappointments:[Appointment])-> () , failed: @escaping (_ error:LLError) -> () ){
        let functionUrl = "doctor/appointments"
        
        let parameters = ["flag":flag]
        APIClient.sendRequest(path: functionUrl, httpMethod: .get, parameters: parameters, success: { (response) in
            let responseData = response as? [[String : Any]] ?? [[:]]
            var doctorappointments = [Appointment]()
            responseData.forEach({ (data) in
                doctorappointments.append(Appointment(json: data))
            })
            completed(doctorappointments)
        }) { (_ error) in
            failed(error)
        }
    }
    
    
    func getAllRadiology(completed: @escaping ()-> () , failed: @escaping (_ error:LLError) -> () ){
       allRadiology.removeAll()
          let functionUrl = "radiology"
        APIClient.sendRequest(path: functionUrl, httpMethod: .get, parameters: [:], success: { (response) in
            let responseData = response as? [[String : Any]] ?? [[:]]
            responseData.forEach({ (data) in
                self.allRadiology.append(Radiology(json: data))
            })
            completed()
        }) { (_ error) in
            failed(error)
        }
    }
    
    
    func getAllLaboratory(completed: @escaping ()-> () , failed: @escaping (_ error:LLError) -> () ){
        allLaboratory.removeAll()
          let functionUrl = "laboratory"
        APIClient.sendRequest(path: functionUrl, httpMethod: .get, parameters: [:], success: { (response) in
            let responseData = response as? [[String : Any]] ?? [[:]]
            responseData.forEach({ (data) in
                self.allLaboratory.append(Radiology(json: data))
            })
            completed()
        }) { (_ error) in
            failed(error)
        }
    }
    
    
    func getPatientDrugs(patientSocialId:String,completed: @escaping (_ drugs:[Drugs])-> () , failed: @escaping (_ error:LLError) -> () ){
        
           let functionUrl = "patient/drugs/\(patientSocialId)"
       
        APIClient.sendRequest(path: functionUrl, httpMethod: .get, parameters: [:], success: { (response) in
            let responseData = response as? [[String : Any]] ?? [[:]]
            var drugs = [Drugs]()
            responseData.forEach({ (data) in
                drugs.append(Drugs(json: data))
            })
            completed(drugs)
        }) { (_ error) in
            failed(error)
        }
    }
    
    
    
    
}

