//
//  MHCheckPatientBeforeAddViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHCheckPatientBeforeAddViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIBarButtonItem!
    @IBOutlet weak var IdentificationNumberLabel: UITextField!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    var address:String?
    var social_id:String?
    var firstName:String?
    var middleName:String?
    var lastName:String?
    var maritalStatus:String?
    var email:String?
    var birthday:String?
    var phoneNumber:String?
    var mobileNumber:String?
    var gender:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitButton(sender: AnyObject) {
        //        checkPatient()
        //        let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
        //        spiningActivity.label.text = "Sending"
        //        spiningActivity.detailsLabel.text = "Please Wait"
        DataClient.shared.getPatientBySocialID(idNumber: IdentificationNumberLabel.text!, completed: { (_ patient) in
            self.firstName = patient.firstName
            self.middleName = patient.middleName
            self.lastName = patient.lastName
            self.address = patient.address
            self.maritalStatus = patient.maritalStatus
            self.mobileNumber = patient.mobile
            self.phoneNumber = patient.phone
            self.gender = patient.gender
            self.email = patient.email
            self.birthday = patient.dob
            self.performSegue(withIdentifier: "AddPatient", sender: self)
            
        }) { (_ error) in
            //            let alert = UIAlertController(title: "Alert", message:error, preferredStyle: .alert)
            //            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //            self.present(alert, animated: true)
            self.performSegue(withIdentifier: "AddNewPatient", sender: self)
            
        }
        
        
    }

    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AddPatient") {
            let sendVC: MHAddPatientViewController = segue.destination as! MHAddPatientViewController
            sendVC.isNewflag = false
            sendVC.firstName = firstName!
            sendVC.middleName = middleName!
            sendVC.lastName = lastName!
            sendVC.address = address!
            sendVC.maritalStatus = maritalStatus!
            sendVC.mobileNumber = mobileNumber!
            sendVC.phoneNumber = phoneNumber!
            sendVC.gender1 = gender!
            sendVC.email = email!
            sendVC.birthday = birthday!
            sendVC.socialID = IdentificationNumberLabel.text!
            
            // sendVC.idNumberText.text = IdentificationNumberLabel.text!
            
        }else if(segue.identifier == "AddNewPatient") {
            let sendVC: MHAddPatientViewController = segue.destination as! MHAddPatientViewController
            sendVC.isNewflag = true
            sendVC.socialID = IdentificationNumberLabel.text!
            
            
        }
        
        
    }
    
    
}
