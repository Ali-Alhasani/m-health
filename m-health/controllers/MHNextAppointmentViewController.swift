//
//  MHNextAppointmentViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/30/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHNextAppointmentViewController: UIViewController {
    var pathologicalCase:String?
    var diagnose: String?
    var diagnoseDescription: String?
    var durgs: String?
    var socailId:String?
    
    
    @IBOutlet weak var nextAppointmentDateText: UITextField!
    @IBOutlet weak var nextAppointmentTimeText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func finishButton(_ sender: Any) {
        let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
        spiningActivity.label.text = "Sending"
        spiningActivity.detailsLabel.text = "Please Wait"
        
        
        Connect.shared.createDiagnose(patient_id: Int(socailId!)!, arival_case: "hggh", payed: 100, importance: "hh", diagnose: diagnose!, diagnose_description: diagnoseDescription!, pathological_case: pathologicalCase!, allDrugs: allDurgs , appointment_date: nextAppointmentDateText.text!, appointment_time: nextAppointmentTimeText.text!, laboratory_name: "gg", laboratory_note: "hh", radiology_name: "hh", radiology_note: "hh", completed: { (_ meassge) in
            print(meassge)
            MBProgressHUD.hide(for: self.view, animated: true)
        }) { (_ error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
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
