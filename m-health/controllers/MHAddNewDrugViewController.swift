//
//  MHAddNewDrugViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 12/5/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHAddNewDrugViewController: UIViewController {
    
    @IBOutlet weak var commercialDrugNameText: UITextField!
    @IBOutlet weak var scientificDrugNameText: UITextField!
    @IBOutlet weak var descriptionDrugText: UITextField!
    @IBOutlet weak var pharmacyText: UITextField!
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
