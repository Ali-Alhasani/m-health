//
//  MHAddPatientViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHAddPatientViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddPatientButton(_ sender: Any) {
        
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
