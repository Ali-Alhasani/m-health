//
//  MHAddMedicationViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/29/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit


class MHAddMedicationViewController: UIViewController,UITextFieldDelegate,MedicationBuliderViewControllerDelegate {
    
    func MedicationBuliderViewController(_ controller: MHMedicationBuliderViewController, didFinishAdding item: MedicationItem) {
        DoseValue =  item.DoseValue
         UnitValue =  item.UnitValue
         RouteValue =  item.RouteValue
         FrequencyValue =  item.FrequencyValue
     
        navigationController?.popViewController(animated: true)
        BuliderText.text = item.DoseValue + " " +  item.UnitValue  + " " +  item.RouteValue  + " " + item.FrequencyValue
        BuliderText.resignFirstResponder()

    }
    
    func EmptyMedicationBuliderViewController(_ controller: MHMedicationBuliderViewController) {
        BuliderText.resignFirstResponder()
         navigationController?.popViewController(animated: true)
    }
    
    var durgs:Drugs = Drugs()

    @IBOutlet weak var medicationNameText: UITextField!
    @IBOutlet weak var BuliderText: UITextField!
    @IBOutlet weak var noteForPharrmacyText: UITextField!
    @IBOutlet weak var indicationText: UITextField!
    @IBOutlet weak var whenNecessarySwitch: UISwitch!
    @IBOutlet weak var startDateText: UITextField!
    @IBOutlet weak var endDateText: UITextField!
    @IBOutlet weak var internalNotesText: UITextField!
    
    var DoseValue:String?
    var UnitValue:String?
    var RouteValue:String?
    var FrequencyValue:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        BuliderText.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == BuliderText){
            if(BuliderText.text?.isEmpty)!{
            view.endEditing(true)
            self.performSegue(withIdentifier: "toBulider", sender: self)
            }
           
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toBulider" {
            let controller = segue.destination as! MHMedicationBuliderViewController
            controller.delegate = self
           }
        if(BuliderText.text?.isEmpty)!{
          
        }else{
        durgs.name = medicationNameText.text!
        durgs.dose =  DoseValue!
        durgs.route = RouteValue!
        durgs.frequency = FrequencyValue!
        durgs.direction = "String"
        durgs.duration =  "String"
        durgs.note = noteForPharrmacyText.text!
        durgs.indication = indicationText.text!
        durgs.necessaryFlag = whenNecessarySwitch.isOn.description
        durgs.startDate = startDateText.text!
        durgs.endDate = endDateText.text!
        durgs.internalNote = internalNotesText.text!
        print("I'm here")
        }
        
    }
    
//    @IBAction func unwindFromAddVC(_ sender: UIStoryboardSegue){
//        if sender.source is MHMedicationBuliderViewController {
//            if let senderVC = sender.source as? MHMedicationBuliderViewController {
//                DoseValue =  senderVC.DoseValue
//                UnitValue =  senderVC.UnitValue
//                RouteValue =  senderVC.RouteValue
//                FrequencyValue =  senderVC.FrequencyValue
//                BuliderText.text = DoseValue! +  UnitValue! +  RouteValue! + FrequencyValue!
//            }
//        }
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
