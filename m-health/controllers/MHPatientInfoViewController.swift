//
//  MHPatientInfoViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/28/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHPatientInfoViewController: UIViewController {
    var patientName :String?
    var gender:String?
    var birthday: String?
    var socailId:String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var startVisitButton: UIButton!
    @IBOutlet weak var vitalsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;
        if let patientName = patientName, let gender = gender, let birthday = birthday {
            nameLabel.text = patientName
            genderLabel.text = gender
            birthdayLabel.text = birthday
        }else {
            guard let socailId = socailId else {
                return
            }
            load(socailId: socailId)
        }
        avatarImage.setAsCircle(cornerRadius: 35, borderColor: .gray, borderWidth: 0.5)
         startVisitButton.setAsCircle(cornerRadius: 6)
          vitalsButton.setAsCircle(cornerRadius: 6)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startVistButton(_ sender: Any) {
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func load(socailId:String) {
        DataClient.shared.getPatientBySocialID(idNumber: socailId, completed: { (_ patient) in
            self.nameLabel.text = patient.firstName! + " " +  patient.middleName! + " " +  patient.lastName!
            self.genderLabel.text = patient.gender
            self.birthdayLabel.text = patient.dob
        }) { (_ error) in
            
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCheck" {
            let navVc = segue.destination as! MHAddCheckViewController
            navVc.socailId = socailId
        }
     }

    
}
