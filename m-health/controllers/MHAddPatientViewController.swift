//
//  MHAddPatientViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHAddPatientViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource  {
    
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
    var isNewflag:Bool?
    var address:String?
    var firstName:String?
    var middleName:String?
    var lastName:String?
    var maritalStatus:String?
    var email:String?
    var birthday:String?
    var phoneNumber:String?
    var mobileNumber:String?
    var gender1:String?
    var socialID:String?
    
    var gender = ["Male","Female"]
    let MStatus = ["Single","Married","Widowed","Divorced"]
    var itemPicker: UIPickerView! = UIPickerView()
    var itemPicker2: UIPickerView! = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.birthdayText.delegate = self
        self.genderText.delegate = self
        self.maritalStatusText.delegate = self
        
        if isNewflag! {
            idNumberText.text = socialID
        }else{
            idNumberText.text = socialID!
            firstNameText.text = firstName!
            middleNameText.text = middleName!
            lastNameText.text = lastName!
            addressText.text = address!
            maritalStatusText.text = maritalStatus!
            mobileNumberText.text = mobileNumber!
            genderText.text = gender1!
            birthdayText.text = birthday!
            emailText.text = email!
            phoneNumberText.text = phoneNumber!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == itemPicker) {
            return gender.count
        }else if (pickerView == itemPicker2){
            return MStatus.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == itemPicker) {
            return gender[row]
        }else{
            return MStatus[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if (pickerView == itemPicker) {
            genderText.text = gender[row]
        }else{
            maritalStatusText.text = MStatus[row]
        }
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == birthdayText){
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.date
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(MHAddPatientViewController.datePickerchanged(sender:)), for: .valueChanged)
        }
        if (textField == genderText){
            self.genderText.text = "Male"
            self.itemPicker!.delegate = self
            self.itemPicker!.dataSource = self
            self.genderText.inputView = self.itemPicker
            
        }else if(textField == maritalStatusText){
            self.maritalStatusText.text = MStatus[0]
            self.itemPicker2!.delegate = self
            self.itemPicker2!.dataSource = self
            self.maritalStatusText.inputView = self.itemPicker2
        }
        
    }
    
    func datePickerchanged(sender: UIDatePicker) {
        let format = DateFormatter()
        format.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        format.dateFormat = "yyyy-MM-dd"
        
        birthdayText.text = format.string(from: sender.date)
    }
    
    @IBAction func AddPatientButton(_ sender: Any) {
        if(idNumberText.text!.isEmpty || firstNameText.text!.isEmpty || middleNameText.text!.isEmpty || lastNameText.text!.isEmpty  || addressText.text!.isEmpty || maritalStatusText.text!.isEmpty ||  mobileNumberText.text!.isEmpty ||  phoneNumberText.text!.isEmpty ||  genderText.text!.isEmpty || emailText.text!.isEmpty || birthdayText.text!.isEmpty){
            let alert = UIAlertController(title: "Alert", message: "Please make sure that you fill all feild", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }else{
            if !isNewflag! {
                self.performSegue(withIdentifier: "toDiagnose", sender: self)
            }
            let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
            spiningActivity.label.text = "Sending"
            spiningActivity.detailsLabel.text = "Please Wait"
            DataClient.shared.addpatient(idNumber: idNumberText.text!, firstName: firstNameText.text!, middleName: middleNameText.text!, lastName: lastNameText.text!, address: addressText.text!, maritalStatus: maritalStatusText.text!, mobileNumber: mobileNumberText.text!, phoneNumber: phoneNumberText.text!, gender: genderText.text!, email: emailText.text!, birthday: birthdayText.text!, completed: { (_ socialId,_ firstName , _ lastName) in
                MBProgressHUD.hide(for: self.view, animated: true)
                self.performSegue(withIdentifier: "toDiagnose", sender: self)
                
            }, failed: { (_ error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                let alert = UIAlertController(title: "Alert", message:error.message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            })
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toDiagnose" {
            let tabBarC : UITabBarController = segue.destination as! UITabBarController
            let navVc = tabBarC.viewControllers!.first as! UINavigationController
            let targetController = navVc.viewControllers.first as! MHPatientInfoViewController
            
            targetController.patientName = firstNameText.text! +  middleNameText.text! +  lastNameText.text!
            targetController.gender = genderText.text!
            targetController.birthday = birthdayText.text!
            targetController.socailId = idNumberText.text!
            
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
