//
//  MHEditPatientInfoViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 4/21/18.
//  Copyright © 2018 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHEditPatientInfoViewController: UIViewController {

    @IBOutlet weak var idNumberText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var middleNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var maritalStatusText: UITextField!
    @IBOutlet weak var mobileNumberText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    
    var socailId:String?
    override func viewDidLoad() {
        super.viewDidLoad()
         load()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
    }
    
    
    
    func load(){
        DataClient.shared.getPatientBySocialID(idNumber: socailId!, completed: { (_ patient) in
            self.idNumberText.text = patient.socialId!
            self.firstNameText.text = patient.firstName!
            self.middleNameText.text = patient.middleName!
            self.lastNameText.text = patient.lastName!
            self.addressText.text = patient.address!
            self.maritalStatusText.text = patient.maritalStatus!
            self.mobileNumberText.text = patient.mobile!
            self.phoneNumberText.text = patient.phone!
            self.genderText.text = patient.gender!
            self.emailText.text = patient.email!
            self.birthdayText.text = patient.dob!
        }) { (_ error) in
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
