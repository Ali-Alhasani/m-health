//
//  MHNextAppointmentViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 11/30/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHNextAppointmentViewController: UIViewController,AddRadiologyViewControllerDelegate,AddLaboratoryViewControllerDelegate,UITextFieldDelegate  {
    
    func LaboratoryViewController(_ controller: MHAddLaboratoryViewController, didFinishAdding item: Radiology) {
         self.laborttory = item
    }
    
    func RadiologyViewController(_ controller: MHAddRadiologyViewController, didFinishAdding item: Radiology) {
        self.radiology = item
    }
    
    var pathologicalCase:String?
    var diagnose: String?
    var diagnoseDescription: String?
    var durgs: String?
    var socailId:String?
    var allDurgs = [Drugs]()
    var status:String = "status"
    var laborttory:Radiology?
    var radiology:Radiology?
    
    @IBOutlet weak var nextAppointmentDateText: UITextField!
    @IBOutlet weak var nextAppointmentTimeText: UITextField!
    @IBOutlet weak var laboratoryButton: UIButton!
    @IBOutlet weak var radidologyButton: UIButton!
    
    let gap : CGFloat = 10
    let borderSize : CGFloat = 1
    let textHeight : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextAppointmentDateText.delegate = self
        nextAppointmentTimeText.delegate = self
        // Do any additional setup after loading the view.
        let imageOrigin : CGFloat =  25
        let textTop : CGFloat = imageOrigin + 40 + gap/2
        let textBottom : CGFloat = gap
        let imageBottom : CGFloat = textBottom + textHeight + gap/2
        
        laboratoryButton.setAsCircle(cornerRadius: 5, borderColor: .gray, borderWidth: 0.5)
        laboratoryButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: imageOrigin, bottom: imageBottom, right: imageOrigin)
        
        laboratoryButton.titleEdgeInsets = UIEdgeInsets(top: textTop, left: -(laboratoryButton!.imageView?.image?.size.width)!, bottom: textBottom, right: 0.0)
        
        radidologyButton.setAsCircle(cornerRadius: 5, borderColor: .gray, borderWidth: 0.5)
        radidologyButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: imageOrigin, bottom: imageBottom, right: imageOrigin)
        
        radidologyButton.titleEdgeInsets = UIEdgeInsets(top: textTop, left: -(radidologyButton!.imageView?.image?.size.width)!, bottom: textBottom, right: 0.0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toRadiology"{
            let vc = segue.destination as! MHAddRadiologyViewController
            vc.delegate = self
        }else if segue.identifier == "toLaboratory"{
            let vc = segue.destination as! MHAddLaboratoryViewController
            vc.delegate = self
            
            
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        if(textField == nextAppointmentDateText){
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.date
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(self.datePickerchanged(sender:)), for: .valueChanged)
        }
        if(textField == nextAppointmentTimeText){
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.time
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(self.timeDiveChanged), for: .valueChanged)
        }
    
    }
    
    @objc func datePickerchanged(sender: UIDatePicker) {
        nextAppointmentDateText.text = format().string(from: sender.date)
    }
  
    @objc func timeDiveChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        nextAppointmentTimeText.text = formatter.string(from: sender.date)
    }
    
    func format() -> DateFormatter{
        let format = DateFormatter()
        format.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
        format.dateFormat = "yyyy-MM-dd"
        return format
    }
    
    @IBAction func finishButton(_ sender: Any) {
        let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
        spiningActivity.label.text = "Sending"
        spiningActivity.detailsLabel.text = "Please Wait"
        
        
        DataClient.shared.createDiagnose(patient_id: Int(socailId!)!, arival_case: "hggh", payed: 100, importance: "hh", diagnose: diagnose!, diagnose_description: diagnoseDescription!, pathological_case: pathologicalCase!,status:status,  allDrugs: allDurgs , appointment_date: nextAppointmentDateText.text!, appointment_time: nextAppointmentTimeText.text!, laboratory: laborttory , radiology:radiology , completed: { (_ meassge) in
            print(meassge)
            MBProgressHUD.hide(for: self.view, animated: true)
        }) { (_ error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            let alert = UIAlertController(title: "Alert", message: error.message, preferredStyle: .alert)
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
