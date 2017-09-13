//
//  M-HLoginViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 1/12/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class M_HLoginViewController: UIViewController {

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

    
    @IBAction func loginAction(_ sender: Any) {
        let appDel : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDel.loginUser()
    }
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }
    
    
}
