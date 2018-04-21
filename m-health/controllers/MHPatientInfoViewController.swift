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
    @IBOutlet weak var preRequestButton: UIButton!
    
    
    let gap : CGFloat = 8
    let borderSize : CGFloat = 1
    let textHeight : CGFloat = 13

    
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
        
       // 75 - 10 = 65 - 40 = 15 - 4 = 11
        let imageOrigin : CGFloat =  10
        let textTop : CGFloat = imageOrigin + 48 + gap/2
        let textBottom : CGFloat = gap + 2
        let imageBottom : CGFloat = textBottom + textHeight + gap/2
        
        preRequestButton.setAsCircle(cornerRadius: 5, borderColor: .gray, borderWidth: 0.5)
        preRequestButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: imageOrigin, bottom: imageBottom, right: imageOrigin)
        
        preRequestButton.titleEdgeInsets = UIEdgeInsets(top: textTop, left: -(preRequestButton!.imageView?.image?.size.width)!, bottom: textBottom, right: 0.0)
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
        }else  if segue.identifier == "toPatientInfo"{
            let navVc = segue.destination as! MHEditPatientInfoViewController
            navVc.socailId = socailId
        }
     }

    
}
