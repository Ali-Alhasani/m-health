//
//  MHAddCheckViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 2/24/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHAddCheckViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var pathologicalCaseText: UITextField!
    @IBOutlet weak var diagnoseText: UITextField!
    @IBOutlet weak var diagnoseDescriptionText: UITextField!
    @IBOutlet weak var durgsText: UITextField!
    
    var socailId:String?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func AddDrugsButton(_ sender: Any) {
        self.performSegue(withIdentifier: "to Durgs Bulider", sender: self)
    }
    
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if(textField == durgsText){
//            if(durgsText.text?.isEmpty)!{
//
//            }
//        }
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextAppointment"{
      let vc = segue.destination as! MHNextAppointmentViewController
            vc.diagnose = diagnoseText.text!
            vc.diagnoseDescription = diagnoseDescriptionText.text!
            vc.pathologicalCase = pathologicalCaseText.text!
            vc.socailId = socailId
            
        }
        
    }
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
 
    */

}
