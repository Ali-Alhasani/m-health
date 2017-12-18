//
//  MHUpdateDoctorInfoViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 9/13/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHUpdateDoctorInfoViewController: UIViewController {

    @IBOutlet weak var socialID: UITextField!
    @IBOutlet weak var doctorFirstName: UITextField!
    @IBOutlet weak var doctorMiddleName: UITextField!
    @IBOutlet weak var doctorLastName: UITextField!
    @IBOutlet weak var doctorDescription: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var userNameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
