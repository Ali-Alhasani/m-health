//
//  MHDoctorInfoSignUpViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 1/24/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit
var userInfo = Usrers()
class MHDoctorInfoSignUpViewController: UIViewController {
    @IBOutlet weak var socialIDText: UITextField!
    
    @IBOutlet weak var doctorFirstNameText: UITextField!
    @IBOutlet weak var doctorMiddleNameText: UITextField!
    @IBOutlet weak var doctorLastNameText: UITextField!
    @IBOutlet weak var doctorDescriptionText: UITextField!
    @IBOutlet weak var mobileNumberText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var DoctorSpecialistText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func nextButton(_ sender: Any) {
        if(doctorFirstNameText.text!.isEmpty || doctorMiddleNameText.text!.isEmpty || doctorLastNameText.text!.isEmpty || mobileNumberText.text!.isEmpty  || genderText.text!.isEmpty  || socialIDText.text!.isEmpty || DoctorSpecialistText.text!.isEmpty ){
            let alert = UIAlertController(title: "Alert", message: "Please make sure that you fill all feild", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }else{
            userInfo.firstName = doctorFirstNameText.text!
        userInfo.middleName = doctorMiddleNameText.text!
        userInfo.lastName = doctorLastNameText.text!
        userInfo.mobile = mobileNumberText.text!
        userInfo.gender = genderText.text!
        userInfo.soicalID = Int(socialIDText.text!)!
        userInfo.specialist = DoctorSpecialistText.text!
        userInfo.bio = doctorDescriptionText.text!
            self.performSegue(withIdentifier: "toStep3", sender: self)

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
