//
//  Connect.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/22/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class Connect{
    
    static let shared = Connect()
    private init() {}
    private var url = "http://127.0.0.1:8000/api/"
    
    let token = UserDefaults.standard.object(forKey: "token") as? String
    
    func login(userName:String, password:String, completed: @escaping (_ name: String, _ email:String , _ token: String)-> () , failed: @escaping (_ error:String) -> () ){
        let functionUrl = url + "login"
        let parameters = ["username": userName, "password": password]
        Alamofire.request(functionUrl,method: .post, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let user = json["user"].dictionaryValue
                    
                    let name = user["first_name"]?.stringValue
                    let email = user["email"]?.stringValue
                    let token = user["token"]?.stringValue
                    completed(name!,email!,token!)
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    failed(error.localizedDescription)
                }
            }
            
        }
    }
    
    func registerdoctor(first_name:String,middle_name:String,last_name:String, password:String, email:String, bio:String,specilist:String,phone:String,mobile:String ,completed: @escaping ()-> () , failed: @escaping (_ error:String) -> () ){
        print(first_name, middle_name, last_name, password, email, bio ,specilist,phone, mobile)
        let functionUrl = url + "register"
        let parameters = ["first_name": first_name,"middle_name": middle_name,"last_name": last_name,"phone": phone,"mobile": mobile,"email":email, "password":password, "bio":bio,"specilist":specilist,"user_type":"1"]
        Alamofire.request(functionUrl,method: .post, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    completed()
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    failed(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    
    func registerclinic(name:String, mobile:String, address:String, completed: @escaping ()-> () , failed: @escaping (_ error:String) -> () ){
        let functionUrl = url + "clinic/create"
        let parameters = ["name": name, "mobile":mobile, "address":address]
        
        Alamofire.request(functionUrl,method: .get, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    completed()
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    failed(error.localizedDescription)
                }
            }
        }
    }
    
    func addpatient(idNumber:String,firstName:String,middleName:String,lastName:String,address:String,maritalStatus:String,mobileNumber:String, phoneNumber:String, gender:String, email:String,birthday:String, completed: @escaping (_ socialId:String,_ firstName:String,_ lastName:String)-> () , failed: @escaping (_ error:String) -> () ){
        let functionUrl = url + "register"
        let parameters = ["social_id": idNumber, "first_name":firstName, "middle_name":middleName,"last_name":lastName, "marital_status":maritalStatus,"email":email,"password": "123456" ,"dob":birthday,"phone":phoneNumber,"mobile":mobileNumber,"gender":gender,"user_type":"2"]
        Alamofire.request(functionUrl,method: .post, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let user = json["user"].dictionaryValue
                    let socialId = user["social_id"]?.stringValue
                    let firstName = user["first_name"]?.stringValue
                    let lastName = user["last_name"]?.stringValue
                    completed(socialId!,firstName!,lastName!)
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    failed(error.localizedDescription)
                }
            }
        }
    }
    func getPatientBySocialID(idNumber:String, completed: @escaping (_ firstName:String,_ middleName:String,_ lastName:String,_ address:String,_ maritalStatus:String,_ mobileNumber:String,_ phoneNumber:String,_ gender:String,_ email:String,_ birthday:String)-> () , failed: @escaping (_ error:String) -> () ){
        let functionUrl = url + "patient/" + idNumber
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/x-www-form-urlencoded"
            
        ]
        Alamofire.request(functionUrl,method: .get,headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let patient = json["patient"].dictionaryValue
                    let social_id = patient["social_id"]?.stringValue
                    let first_name = patient["first_name"]?.stringValue
                    let middle_name = patient["middle_name"]?.stringValue
                    let last_name = patient["last_name"]?.stringValue
                    //let marital_status = patient["marital_status"]?.stringValue
                    let email = patient["email"]?.stringValue
                    let dob = patient["DOB"]?.stringValue
                    let phone = patient["phone"]?.stringValue
                    let mobile = patient["mobile"]?.stringValue
                    //let gender = patient["gender"].stringValue
                    let gender = "male"
                    completed(social_id!,first_name!,middle_name!,last_name!,"marital_status!",email!,dob!,phone!,mobile!, gender)
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    failed(error.localizedDescription)
                }
            }
        }
        
    }
    
    func allpatients(completed: @escaping (_ allPatients:[Patients])-> () , failed: @escaping (_ error:String) -> ()){
        let functionUrl = url + "patients"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json: 1"
        ]
        Alamofire.request(functionUrl,method: .get,headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let allPatient = json["patient"].arrayValue
                    var patinets = [Patients]()
                    for patient in allPatient {
                        let social_id = patient["social_id"].stringValue
                        let first_name = patient["first_name"].stringValue
                        let middle_name = patient["middle_name"].stringValue
                        let last_name = patient["last_name"].stringValue
                        let marital_status = patient["marital_status"].stringValue
                        let email = patient["email"].stringValue
                        let dob = patient["dob"].stringValue
                        let phone = patient["phone"].stringValue
                        let mobile = patient["mobile"].stringValue
                        let gender = patient["gender"].stringValue
                        
                        
                        patinets.append(Patients(socialId: social_id, firstName: first_name, middleName: middle_name, lastName: last_name, maritalStatus: marital_status, email: email, dob: dob, phone: phone, mobile: mobile, gender: gender))
                        
                    }
                    completed(patinets)
                    
                    
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    failed(error.localizedDescription)
                }
            }
        }
        
        
        
    }
    
    func getdoctorPorfile(completed: @escaping (_ name:String,_ address:String,_ clinicName:String,_ bio:String)-> () , failed: @escaping (_ error:String) -> () ){
        let functionUrl = url + "doctor/profile"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        Alamofire.request(functionUrl,method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let Doctor = json["Doctor"].dictionaryValue
                    let specilist = Doctor["specilist"]?.stringValue
                    let clinicName = Doctor["clinic_name"]?.stringValue
                    let address = Doctor["address"]?.stringValue
                    let name = Doctor["name"]?.stringValue
                    completed(name!,address!,clinicName!,specilist!)
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    failed(error.localizedDescription)
                }
            }
        }
    }
    //    func diagnose(patient_id:String, arival_case:String,payed:String,importance:String,diagnose:String,diagnose_description:String,pathological_case:String){
    //
    //    }
    //    func drugs(name:String, dose:String,route:String,frequency:String,direction:String,duration:String,note:String,indication:String,necessary_flag:String,start_date:String,end_date:String,internal_note:String){
    //
    //    }
    //    func nextAppointment(appointment_date:String, appointment_time:String){
    //
    //    }
    //    func laboratory(laboratory_name:String, note:String){
    //
    //    }
    //    func radiology(radiology_name:String, note:String){
    //
    // }
    
    func createDiagnose (patient_id:Int, arival_case:String,payed:Int,importance:String,diagnose:String,diagnose_description:String,pathological_case:String,allDrugs:[Durgs],appointment_date:String, appointment_time:String,laboratory_name:String, laboratory_note:String,radiology_name:String, radiology_note:String ,completed: @escaping (_ message:String)-> () , failed: @escaping (_ error:String) -> () ){
        let functionUrl = url + "appoiment/all/create"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        
        let diagnose:JSON = ["patient_id":patient_id,"arival_case":arival_case,"payed":payed,"importance":importance,"diagnose":diagnose,"diagnose_description": diagnose_description]
        let appointment:JSON = ["pathological_case":pathological_case]
        let next_appointment:JSON = ["appointment_date":appointment_date,"appointment_time":appointment_time]
        
        var drugs = [[String:Any]]()
        for i in allDrugs{
            drugs.append(["name" :i.name! ,"dose" :i.dose!,"route":i.route!, "frequency":i.frequency!,"direction":i.direction!,"duration":i.duration!,"note":i.note!,"indication":i.indication!,"necessary_flag":"false","start_date":i.startDate!,"end_date":i.endDate!,"internal_note":i.internalNote!])
        }
        let allDurges = JSON(drugs)
        
        let parameters = ["diagnose":diagnose,"appointment":appointment,"drugs":allDurges,"next_appointment":next_appointment] as [String : Any]
        
        
        
        let request =  Alamofire.request(functionUrl,method:.post,parameters:parameters,headers: headers ).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    completed(message)
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    print("Fuck Amr")
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    
                    failed(error.localizedDescription)
                }
            }
            
        }
        print(request)
        
    }
    
    func getDoctorAppointments(flag:Int ,completed: @escaping (_ doctorappointments:[Appointment])-> () , failed: @escaping (_ error:String) -> () ){
        let functionUrl = url + "doctor/appointments"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json: 1"
        ]
        let parameters = ["flag":flag]
        Alamofire.request(functionUrl, method: .get,parameters:parameters, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let appointments = json["appointments"].arrayValue
                    var doctorappointments = [Appointment]()
                    for tmp in appointments {
                        let appointmentID = tmp["id"].intValue
                        let diagnoseID = tmp["diagnose_id"].intValue
                        let description = tmp["decription"].stringValue
                        let note = tmp["note"].stringValue
                        let status = tmp["status"].stringValue
                        let created = tmp["created_at"].stringValue
                        doctorappointments.append(Appointment(appointmentID: appointmentID, diagnoseID: diagnoseID, description: description, note: note, status: status, created: created))
                    }
                    print("completed")
                }else {
                    failed("something wrong..!")
                }
            case .failure(let error):
                if let value = response.result.value {
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    failed(message)
                }else{
                    failed(error.localizedDescription)
                }
            }
        }
        
    }
    

    
    
}

